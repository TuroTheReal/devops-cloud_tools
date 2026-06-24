#!/usr/bin/env bash
#
# Script: monitor-host.sh
# Description: Poll un host et affiche timestamp + code HTTP + quelle origine sert
#              (OLD/NEW, detectee par un marqueur de contenu unique a chaque origine).
#              000/DOWN = le gap de downtime. Utile pour n'importe quelle bascule:
#              cutover, deploiement, switch DNS, failover. Ctrl-C pour stop.
# Usage: ./monitor-host.sh <host> [interval_s]
#
# Prerequisites:
#   - bash, curl, grep
#
# Environment:
#   OLD_MARKER  (optional)  chaine de contenu unique a la reponse de l'ANCIENNE origine
#   NEW_MARKER  (optional)  chaine de contenu unique a la reponse de la NOUVELLE origine
#   (si un marqueur est vide, cette origine n'est pas detectee -> affiche "?")
#
# Examples:
#   ./monitor-host.sh app.example.com
#   ./monitor-host.sh app.example.com 0.5
#   OLD_MARKER="Served by Pages" NEW_MARKER="x-served-by-worker" \
#     ./monitor-host.sh app.example.com
#
# Source: Extracted from a Cloudflare Pages -> Workers migration (2026-06)
# Tested on: macOS, Ubuntu
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
