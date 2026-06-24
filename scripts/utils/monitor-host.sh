#!/usr/bin/env bash
#
# Script: monitor-host.sh
# Description: Poll a host and print timestamp + HTTP code + which origin serves
#              (OLD/NEW, detected by a content marker unique to each origin).
#              000/DOWN flags the downtime gap. Useful for any switch: cutover,
#              deploy, DNS switch, failover. Ctrl-C to stop.
# Usage: ./monitor-host.sh <host> [interval_s]
#
# Prerequisites:
#   - bash, curl, grep
#
# Environment:
#   OLD_MARKER  (optional)  content string unique to the OLD origin's response
#   NEW_MARKER  (optional)  content string unique to the NEW origin's response
#   (if a marker is empty, that origin is not detected -> shows "?")
#
# Examples:
#   ./monitor-host.sh app.example.com
#   ./monitor-host.sh app.example.com 0.5
#   OLD_MARKER="Served by Pages" NEW_MARKER="x-served-by-worker" \
#     ./monitor-host.sh app.example.com
#
# Source: Extracted from a Cloudflare Pages -> Workers migration (2026-06)
# Tested on: macOS, Ubuntu
# Last verified: 2026-06
#
HOST="${1:?usage: $0 <host> [interval_s]   e.g. app.example.com}"
INTERVAL="${2:-0.3}"
OLD_MARKER="${OLD_MARKER:-}"
NEW_MARKER="${NEW_MARKER:-}"
URL="https://$HOST"
echo "polling $URL every ${INTERVAL}s (Ctrl-C to stop)"
while true; do
  ts=$(date +%H:%M:%S)
  out=$(curl -s -m 3 -w $'\n%{http_code}' "$URL" || echo $'\nDOWN')
  code=$(echo "$out" | tail -1)
  if   [ -n "$OLD_MARKER" ] && echo "$out" | grep -qi "$OLD_MARKER"; then who=OLD
  elif [ -n "$NEW_MARKER" ] && echo "$out" | grep -qi "$NEW_MARKER"; then who=NEW
  else who="?"; fi
  echo "$ts  $code  $who"
  sleep "$INTERVAL"
done
