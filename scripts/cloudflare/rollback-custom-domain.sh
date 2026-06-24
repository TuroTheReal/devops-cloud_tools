#!/usr/bin/env bash
#
# Script: rollback-custom-domain.sh
# Description: Rollback du cutover Custom Domain. Detache le Worker custom domain,
#              recree le record DNS sauvegarde par cutover-custom-domain.sh, puis
#              reattache le host au projet Pages.
# Usage: ./rollback-custom-domain.sh <host> <pages_project>
#
# Prerequisites:
#   - bash, curl, jq
#   - cutover-custom-domain.sh doit avoir tourne avant (fichier $SAVE present)
#   - Cloudflare API token avec: Zone DNS Edit, Account Workers Edit,
#     Account Cloudflare Pages Edit (verifier les scopes exacts dans le dashboard CF)
#
# Environment:
#   CLOUDFLARE_API_TOKEN  (required)  token API
#   ACCOUNT_ID            (required)  id du compte Cloudflare
#   ZONE_ID               (required)  id de la zone du host
#   SAVE                  (optional)  chemin du record DNS sauvegarde au cutover
#                                     (defaut: /tmp/cf-reconcile-record-<host>.json)
#
# Sequence (inverse du cutover):
#   1. supprime le Worker custom domain
#   2. recree le record DNS depuis $SAVE (type/content/proxied a l'identique)
#   3. reattache le host au projet Pages
#
# Examples:
#   export CLOUDFLARE_API_TOKEN=... ACCOUNT_ID=... ZONE_ID=...
#   ./rollback-custom-domain.sh app.example.com my-pages-project
#
# Source: Extracted from a Cloudflare Pages -> Workers migration (2026-06)
# Tested on: macOS, Ubuntu
#
set -euo pipefail
: "${CLOUDFLARE_API_TOKEN:?export CLOUDFLARE_API_TOKEN first}"
: "${ACCOUNT_ID:?export ACCOUNT_ID first}"
: "${ZONE_ID:?export ZONE_ID first}"
HOST="${1:?usage: $0 <host> <pages_project>}"
PAGES_PROJECT="${2:?usage: $0 <host> <pages_project>}"
API=https://api.cloudflare.com/client/v4
AUTH="Authorization: Bearer $CLOUDFLARE_API_TOKEN"
SAVE="${SAVE:-/tmp/cf-reconcile-record-$HOST.json}"
[ -f "$SAVE" ] || { echo "no saved record at $SAVE (run cutover-custom-domain first)"; exit 1; }

DOMAIN_ID=$(curl -s "$API/accounts/$ACCOUNT_ID/workers/domains" -H "$AUTH" | jq -r ".result[] | select(.hostname==\"$HOST\") | .id")
echo "$(date +%H:%M:%S) DELETE worker custom domain ($DOMAIN_ID)"
curl -s -X DELETE "$API/accounts/$ACCOUNT_ID/workers/domains/$DOMAIN_ID" -H "$AUTH" | jq '.success'

TYPE=$(jq -r '.type' "$SAVE"); CONTENT=$(jq -r '.content' "$SAVE"); PROXIED=$(jq -r '.proxied' "$SAVE")
echo "$(date +%H:%M:%S) RE-CREATE record $TYPE -> $CONTENT (proxied=$PROXIED)"
curl -s -X POST "$API/zones/$ZONE_ID/dns_records" -H "$AUTH" -H "Content-Type: application/json" \
  -d "{\"type\":\"$TYPE\",\"name\":\"$HOST\",\"content\":\"$CONTENT\",\"proxied\":$PROXIED}" | jq '.success, .errors'

echo "$(date +%H:%M:%S) RE-ATTACH pages domain ($PAGES_PROJECT)"
curl -s -X POST "$API/accounts/$ACCOUNT_ID/pages/projects/$PAGES_PROJECT/domains" -H "$AUTH" -H "Content-Type: application/json" -d "{\"name\":\"$HOST\"}" | jq '.success, .errors'
echo "$(date +%H:%M:%S) DONE"
