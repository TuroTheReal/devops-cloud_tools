#!/usr/bin/env bash
#
# Script: rollback-custom-domain.sh
# Description: Rollback of the Custom Domain cutover. Detaches the Worker custom
#              domain, re-creates the DNS record saved by cutover-custom-domain.sh,
#              then re-attaches the host to the Pages project.
# Usage: ./rollback-custom-domain.sh <host> <pages_project>
#
# Prerequisites:
#   - bash, curl, jq
#   - cutover-custom-domain.sh must have run first ($SAVE file present)
#   - Cloudflare API token with: Zone DNS Edit, Account Workers Edit,
#     Account Cloudflare Pages Edit (verify exact scopes in the CF dashboard)
#
# Environment:
#   CLOUDFLARE_API_TOKEN  (required)  API token
#   ACCOUNT_ID            (required)  Cloudflare account id
#   ZONE_ID               (required)  zone id of the host
#   SAVE                  (optional)  path of the DNS record saved at cutover
#                                     (default: /tmp/cf-reconcile-record-<host>.json)
#
# Sequence (reverse of the cutover):
#   1. delete the Worker custom domain
#   2. re-create the DNS record from $SAVE (type/content/proxied identical)
#   3. re-attach the host to the Pages project
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
