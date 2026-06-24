# Runbook: cutover a host from Cloudflare Pages to a Worker

Step-by-step procedure to move a hostname from a Cloudflare Pages project to a
Worker with minimal downtime, using the scripts in this folder. Generic: works
for any host / account / zone (everything is passed by env / args).

## 0. Prerequisites

- `bash`, `curl`, `jq`
- `CLOUDFLARE_API_TOKEN`, `ACCOUNT_ID`, `ZONE_ID` exported (see `.env.example`)
- The target **Worker is already deployed** (via wrangler / CI / Terraform).
- Decide the strategy:
  - **Custom Domain** (`cutover-custom-domain.sh`): the host is a DNS record on the
    Pages project. Touches DNS. Use when the host points at Pages today.
  - **Worker Route** (`cutover-worker-route.sh`): adds a `host/*` route, no DNS
    change. Lighter.

## 1. Preflight

- Confirm the Worker responds on its `*.workers.dev` URL (or a test host).
- Confirm you can identify each origin in the HTML (a content marker for Pages and
  one for the Worker) so the monitor can tell them apart.
- Pick an off-peak window. The cutover has a brief gap.
- Custom-domain strategy: confirm the current DNS record will be saved (the script
  does this to `$SAVE`); without it, rollback cannot restore the record.

## 2. Start the monitor (separate terminal)

```bash
OLD_MARKER="<string unique to Pages HTML>" \
NEW_MARKER="<string unique to Worker HTML>" \
  ../utils/monitor-host.sh app.example.com
```

Watch for `000`/`DOWN` (the gap) and the OLD -> NEW flip.

## 3. Cutover

```bash
# Custom Domain
./cutover-custom-domain.sh app.example.com my-worker my-pages-project
# OR Worker Route
./cutover-worker-route.sh app.example.com my-worker
```

## 4. Verify

- Monitor shows `200` + `NEW` consistently.
- Hit a few real paths, check status + content come from the Worker.
- Check Cloudflare dashboard: the custom domain / route is attached to the Worker.

## 5. Rollback (if NEW is wrong or the gap doesn't close)

```bash
# Custom Domain (needs the record saved at step 3)
./rollback-custom-domain.sh app.example.com my-pages-project
# OR Worker Route
./rollback-worker-route.sh app.example.com
```

Rollback triggers: sustained 5xx from the Worker, wrong content, broken auth/paths,
or the gap not closing within your tolerance.

## 6. Decommission (only after a stable soak)

- Once the Worker has served cleanly for your soak period, decommission the old
  Pages project (or its custom domain) so nothing deploys to it by mistake.

## Gotchas

- **Not idempotent**: re-running a cutover after it succeeded fails at the
  delete/create step. Check state first.
- **`environment` is deprecated** on the Worker custom domain (provider + API).
  Don't set it.
- **CI deploy gap**: your delivery pipeline probably still deploys to the *Pages*
  project. After cutover it must deploy the *Worker* (e.g. `wrangler deploy`),
  otherwise releases land on the dead Pages project. Plan this switch.
- **The gap**: between detach and the new attach, the host can briefly 5xx/000.
  Off-peak + monitor.
- **DNS scripts mutate production DNS.** Rehearse on a sandbox host first.
