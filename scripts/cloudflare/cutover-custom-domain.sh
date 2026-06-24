#!/usr/bin/env bash
#
# Script: cutover-custom-domain.sh
# Description: Cutover a hostname from Cloudflare Pages to a Worker, via a Worker
#              Custom Domain. Saves the current DNS record before deleting it so
#              rollback-custom-domain.sh can restore it identically.
# Usage: ./cutover-custom-domain.sh <host> <worker> <pages_project>
#
# Prerequisites:
#   - bash, curl, jq
#   - Cloudflare API token with: Zone DNS Edit, Account Workers Edit,
#     Account Cloudflare Pages Edit (verify exact scopes in the CF dashboard)
#
# Environment:
#   CLOUDFLARE_API_TOKEN  (required)  API token
#   ACCOUNT_ID            (required)  Cloudflare account id
#   ZONE_ID               (required)  zone id of the host
#   SAVE                  (optional)  path where the DNS record is saved
#                                     (default: /tmp/cf-reconcile-record-<host>.json)
#
# Sequence (order matters):
#   1. save the current DNS record -> $SAVE  (required for rollback)
#   2. detach the host from the Pages project
#   3. delete the DNS record
#   4. create the Worker custom domain
#
# Examples:
#   export CLOUDFLARE_API_TOKEN=... ACCOUNT_ID=... ZONE_ID=...
#   ./cutover-custom-domain.sh app.example.com my-worker my-pages-project
#
# Source: Extracted from a Cloudflare Pages -> Workers migration (2026-06)
# Tested on: macOS, Ubuntu
# Last verified: 2026-06 (against the live Cloudflare API during the migration)
#
set -euo pipefail
: "${CLOUDFLARE_API_TOKEN:?export CLOUDFLARE_API_TOKEN first}"
: "${ACCOUNT_ID:?export ACCOUNT_ID first}"
: "${ZONE_ID:?export ZONE_ID first}"
HOST="${1:?usage: $0 <host> <worker> <pages_project>}"
WORKER="${2:?usage: $0 <host> <worker> <pages_project>}"
PAGES_PROJECT="${3:?usage: $0 <host> <worker> <pages_project>}"
API=https://api.cloudflare.com/client/v4
AUTH="Authorization: Bearer $CLOUDFLARE_API_TOKEN"
SAVE="${SAVE:-/tmp/cf-reconcile-record-$HOST.json}"

echo "$(date +%H:%M:%S) save current record -> $SAVE"
curl -s "$API/zones/$ZONE_ID/dns_records?name=$HOST" -H "$AUTH" | jq '.result[0]' | tee "$SAVE" >/dev/null

echo "$(date +%H:%M:%S) DETACH pages domain ($PAGES_PROJECT)"
curl -s -X DELETE "$API/accounts/$ACCOUNT_ID/pages/projects/$PAGES_PROJECT/domains/$HOST" -H "$AUTH" | jq '.success'

REC_ID=$(jq -r '.id' "$SAVE")
echo "$(date +%H:%M:%S) DELETE record $REC_ID"
curl -s -X DELETE "$API/zones/$ZONE_ID/dns_records/$REC_ID" -H "$AUTH" | jq '.success, .errors'

echo "$(date +%H:%M:%S) CREATE worker custom domain -> $WORKER"
curl -s -X PUT "$API/accounts/$ACCOUNT_ID/workers/domains" -H "$AUTH" -H "Content-Type: application/json" \
  -d "{\"hostname\":\"$HOST\",\"service\":\"$WORKER\",\"zone_id\":\"$ZONE_ID\",\"environment\":\"production\"}" | jq '{success, errors}'
echo "$(date +%H:%M:%S) DONE"
