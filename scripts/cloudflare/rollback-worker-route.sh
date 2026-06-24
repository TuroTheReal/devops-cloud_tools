#!/usr/bin/env bash
#
# Script: rollback-worker-route.sh
# Description: Rollback of the Worker Route cutover. Finds the route whose pattern
#              is <host>/* and deletes it, returning the host to its previous
#              routing (Pages).
# Usage: ./rollback-worker-route.sh <host>
#
# Prerequisites:
#   - bash, curl, jq
#   - Cloudflare API token with: Zone Workers Routes Edit
#     (verify exact scope in the CF dashboard)
#
# Environment:
#   CLOUDFLARE_API_TOKEN  (required)  API token
#   ZONE_ID               (required)  zone id of the host
#
# Examples:
#   export CLOUDFLARE_API_TOKEN=... ZONE_ID=...
#   ./rollback-worker-route.sh app.example.com
#
# Source: Extracted from a Cloudflare Pages -> Workers migration (2026-06)
# Tested on: macOS, Ubuntu
#
set -euo pipefail
: "${CLOUDFLARE_API_TOKEN:?export CLOUDFLARE_API_TOKEN first}"
: "${ZONE_ID:?export ZONE_ID first}"
HOST="${1:?usage: $0 <host>   e.g. app.example.com}"
API=https://api.cloudflare.com/client/v4
AUTH="Authorization: Bearer $CLOUDFLARE_API_TOKEN"

ROUTE_ID=$(curl -s "$API/zones/$ZONE_ID/workers/routes" -H "$AUTH" | jq -r ".result[] | select(.pattern==\"$HOST/*\") | .id")
: "${ROUTE_ID:?no route found for $HOST/* (nothing to rollback)}"
echo "$(date +%H:%M:%S) DELETE route $HOST/* (id=$ROUTE_ID)"
curl -s -X DELETE "$API/zones/$ZONE_ID/workers/routes/$ROUTE_ID" -H "$AUTH" | jq '.success'
