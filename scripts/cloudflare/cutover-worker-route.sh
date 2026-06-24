#!/usr/bin/env bash
#
# Script: cutover-worker-route.sh
# Description: Cutover a hostname to a Worker via a Worker Route (pattern <host>/*).
#              Simpler than the custom domain: does not touch DNS, just creates a
#              route that intercepts the host's traffic and sends it to the Worker.
# Usage: ./cutover-worker-route.sh <host> <worker>
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
#   ./cutover-worker-route.sh app.example.com my-worker
#
# Source: Extracted from a Cloudflare Pages -> Workers migration (2026-06)
# Tested on: macOS, Ubuntu
#
set -euo pipefail
: "${CLOUDFLARE_API_TOKEN:?export CLOUDFLARE_API_TOKEN first}"
: "${ZONE_ID:?export ZONE_ID first}"
HOST="${1:?usage: $0 <host> <worker>   e.g. app.example.com my-worker}"
WORKER="${2:?usage: $0 <host> <worker>   e.g. app.example.com my-worker}"
API=https://api.cloudflare.com/client/v4
AUTH="Authorization: Bearer $CLOUDFLARE_API_TOKEN"

echo "$(date +%H:%M:%S) CREATE route $HOST/* -> $WORKER"
curl -s -X POST "$API/zones/$ZONE_ID/workers/routes" -H "$AUTH" -H "Content-Type: application/json" \
  -d "{\"pattern\":\"$HOST/*\",\"script\":\"$WORKER\"}" | jq '{success, id: .result.id, errors}'
