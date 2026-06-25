# Runbook: zero-downtime cutover from Cloudflare Pages to a Worker

Full procedure to move a hostname from a Cloudflare **Pages** project to a
**Worker** with **zero gap**, then converge the binding into Terraform/IaC and
decommission the old project. Generic: everything is env / args, works for any
host / account / zone.

**Key idea:** a **Worker Route is additive** (it intercepts traffic for the host
without deleting anything), so it gives a **gap-free** cutover and **instant
rollback**. You use the route as a temporary bridge, stabilize, then reconcile the
durable binding (a custom domain) into IaC, remove the bridge, decommission Pages.

## Two ways to use this runbook

- **One-off (no IaC):** do steps 1-3 and stop. The route is your binding. (Or use
  the imperative `cutover-custom-domain.sh`, which has a brief gap.)
- **IaC-managed (recommended):** do all 6 steps. The route is a temporary bridge;
  the durable binding ends up in Terraform as a Worker custom domain.

## Setup (env)

```bash
export CLOUDFLARE_API_TOKEN=...
export ACCOUNT_ID=...   # Cloudflare account id
export ZONE_ID=...      # zone of the host
HOST=app.example.com
WORKER=my-worker
PAGES_PROJECT=my-pages-project
API=https://api.cloudflare.com/client/v4
AUTH="Authorization: Bearer $CLOUDFLARE_API_TOKEN"
```

## The migration: steps, tools, checks

| # | Step | Action | Do | Verify -> expected | Watch | Rollback |
|---|---|---|---|---|---|---|
| 1 | Coexistence | deploy worker (placeholder), Pages stays prod | `terraform apply` + `wrangler deploy` | `curl -sI https://$HOST` -> `200` (Pages serves) | `terraform plan`, CF dashboard | n/a |
| 2 | **Cutover (route)** | route `host/*` -> worker | `./cutover-worker-route.sh "$HOST" "$WORKER"` | route present (check 2 below) · monitor -> `NEW` | monitor, CF Domains & Routes | **instant** (`./rollback-worker-route.sh "$HOST"`) |
| 3 | Observe | stabilize (hours / days) | wait | monitor -> `200` continuous | monitor, your observability (metrics/errors), CF metrics | **instant** |
| 4 | **IaC reconcile** | declare worker custom domain, drop the Pages domain | edit IaC · `terraform apply` | `terraform plan` lists `destroy ...dns_record` (checkpoint) · worker custom domain `enabled:true` (check 3) | monitor | **~1 min of 522** (re-attach Pages) |
| 5 | **Remove route** | delete the temporary route | `./rollback-worker-route.sh "$HOST"` | routes for `$HOST/*` -> `[]` · `curl -sI https://$HOST` -> `200` | monitor | ~1 min |
| 6 | **Decommission** | delete the Pages project | remove `cloudflare_pages*` from IaC · `terraform apply` | Pages project -> not found · `curl -sI https://$HOST` -> `200` · `terraform plan` -> No changes | monitor + API checks | heavy rebuild |
| done | Unlock | release the state lock | (your IaC unlock command) | stack free | n/a | n/a |

**Reversibility tipping point.** Before step 4, rollback is **instant**: delete the
route, Pages is still intact underneath. After step 4, Pages is detached, so
rollback means re-attaching it = **~1 minute of `522`s** while it re-provisions,
and the route no longer helps. Treat step 4 as the point of no easy return: only
cross it after a solid soak at step 3.

## Who serves right now: Pages or Worker?

`jq --arg h "$HOST"` passes the variable cleanly (avoids shell quoting issues).

**1. DNS level (who owns the hostname):**
```bash
curl -s "$API/zones/$ZONE_ID/dns_records?name=$HOST" -H "$AUTH" | jq '.result[] | {type, content}'
# CNAME -> *.pages.dev  => PAGES
# AAAA  -> 100::        => WORKER (Cloudflare's placeholder for worker-routed hosts)
```

**2. Route overlay (wins over DNS):**
```bash
curl -s "$API/zones/$ZONE_ID/workers/routes" -H "$AUTH" | jq --arg h "$HOST" '[.result[] | select(.pattern == ($h + "/*"))]'
# non-empty => worker FORCED by the route (takes priority over DNS)
```

**3. Does the Worker own the custom domain?**
```bash
curl -s "$API/accounts/$ACCOUNT_ID/workers/domains" -H "$AUTH" | jq --arg h "$HOST" '.result[] | select(.hostname == $h) | {hostname, enabled}'
```

**4. Does Pages still own the hostname?**
```bash
curl -s "$API/accounts/$ACCOUNT_ID/pages/projects/$PAGES_PROJECT/domains" -H "$AUTH" | jq '[.result[].name]'
```

**Live monitor** (separate terminal, runs throughout):
```bash
OLD_MARKER="<string unique to Pages HTML>" NEW_MARKER="<string unique to Worker HTML>" \
  ../utils/monitor-host.sh "$HOST"
```

DNS sanity from a local terminal (not the IaC shell): `dig +short @1.1.1.1 $HOST`;
flush cache on macOS with `sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder`.

## Gotchas

- **Route is gap-free, custom domain has a gap.** That is why the route is the
  cutover bridge. The imperative `cutover-custom-domain.sh` (detach Pages domain ->
  delete DNS -> create worker domain) has a brief window; use it only for the
  no-IaC custom-domain case, off-peak, with the monitor.
- **Step 4 is the reversibility cliff** (see above). Don't cross it without a soak.
- **`environment` is deprecated** on the Worker custom domain. Don't set it.
- **CI deploy gap:** after cutover, your pipeline must deploy the *Worker*
  (`wrangler deploy`), not the dead Pages project, or releases land nowhere useful.
- **Not idempotent:** re-running a cutover after success fails on the create/delete
  step. Check current state (the checks above) first.
- **DNS scripts mutate production DNS.** Rehearse the whole flow on a sandbox host.
