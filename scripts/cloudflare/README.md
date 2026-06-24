# CLOUDFLARE

<p align="center">
  <img src="https://img.shields.io/badge/Status-Active-success.svg"/>
  <img src="https://img.shields.io/badge/Type-Automation-blue.svg"/>
  <img src="https://img.shields.io/badge/Tested-Production-green.svg"/>
</p>

<p align="center">
  <i>Zero-downtime cutover of a hostname from Cloudflare Pages to a Worker, with rollback</i>
</p>

---

## About

When you migrate an app from **Cloudflare Pages** to a **Worker**, the hostname has
to be re-pointed from the Pages project to the Worker. These scripts do that
switch (and its rollback) through the Cloudflare API, with a monitor to watch the
gap during the bascule.

Two strategies, pick one:

| Strategy | Scripts | When to use |
| --- | --- | --- |
| **Custom Domain** | `cutover-custom-domain.sh` / `rollback-custom-domain.sh` | The host is a real DNS record attached to the Pages project. Touches DNS: detach Pages domain, delete the record, create a Worker custom domain. |
| **Worker Route** | `cutover-worker-route.sh` / `rollback-worker-route.sh` | Lighter. Adds a route `host/*` -> worker without touching DNS. Rollback just deletes the route. |

The generic [`../utils/monitor-host.sh`](../utils/monitor-host.sh) polls the host
throughout and tells you which origin serves (OLD/NEW) and when the gap
(`000`/`DOWN`) happens.

---

## Prerequisites

- `bash`, `curl`, `jq`
- A Cloudflare API token. Scopes (verify exact names in the CF dashboard):
  - Zone > DNS > Edit *(custom-domain)*
  - Zone > Workers Routes > Edit *(route)*
  - Account > Workers Scripts > Edit *(custom-domain)*
  - Account > Cloudflare Pages > Edit *(custom-domain)*

Copy `.env.example` to `.env`, fill it in, then load it:

```bash
cp .env.example .env
$EDITOR .env
set -a; source .env; set +a   # exports CLOUDFLARE_API_TOKEN, ACCOUNT_ID, ZONE_ID
```

---

## The cutover sequence (custom domain)

Order matters. The script does, in this order:

1. **Save** the current DNS record to `$SAVE` (default `/tmp/cf-reconcile-record-<host>.json`): this is what makes rollback possible.
2. **Detach** the host from the Pages project.
3. **Delete** the DNS record.
4. **Create** the Worker custom domain.

### Rollback contract

`rollback-custom-domain.sh` relies on the file saved at step 1. It deletes the
Worker custom domain, **re-creates the DNS record identically** (`type` / `content`
/ `proxied` read back from `$SAVE`), and re-attaches the Pages domain. If `$SAVE`
is missing, it refuses to run: there is nothing to restore.

---

## Usage

```bash
# Watch the host in another terminal (monitor-host.sh is the generic poller, in ../utils)
OLD_MARKER="<string unique to Pages HTML>" \
NEW_MARKER="<string unique to Worker HTML>" \
  ../utils/monitor-host.sh app.example.com

# Custom domain
./cutover-custom-domain.sh   app.example.com my-worker my-pages-project
./rollback-custom-domain.sh  app.example.com my-pages-project

# Worker route
./cutover-worker-route.sh    app.example.com my-worker
./rollback-worker-route.sh   app.example.com
```

---

## Notes

- **Idempotence**: the cutover scripts are not idempotent. Re-running a cutover
  after it succeeded will fail at the "delete DNS record" / "create domain" step.
  Check state first if unsure.
- **The gap**: between detach and the new domain becoming active, the host can
  briefly 5xx/000. Run the monitor and do this off-peak.
- **DNS scripts mutate production DNS.** Test on a sandbox host first.

---

**Source**: Extracted from a Cloudflare Pages -> Workers migration (2026-06)
**Maintained by**: Arthur Bernard
