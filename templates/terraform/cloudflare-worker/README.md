# Cloudflare Worker hostname binding (Terraform template)

A **static** template to point a hostname at an **already-deployed** Cloudflare
Worker, the Terraform way. The IaC equivalent of the cutover scripts in
[`scripts/cloudflare/`](../../../scripts/cloudflare/). Copy it, fill the
placeholders.

## What this template manages

This template declares the **durable binding**: a Worker **custom domain**
(`cloudflare_workers_custom_domain`). That is the "IaC reconcile" end-state of the
cutover runbook, and the only resource it ships active.

The **Worker Route** plays a different role: a **gap-free transient bridge** you add
during cutover and then delete (see the runbook). Manage it with the scripts
(`cutover-worker-route.sh` / `rollback-worker-route.sh`), **not** in Terraform,
which would create-then-destroy it. `main.tf` keeps a commented route block only
for the rare case where you want a *permanent* route instead of a custom domain.

## Prerequisites

- Terraform / OpenTofu, the `cloudflare/cloudflare` provider (~> 5.0)
- A Cloudflare API token with Workers (and DNS, for custom domain) edit scopes
- The **Worker already deployed** (wrangler / CI). This template only binds the
  hostname; managing the Worker script in TF is optional (commented in `main.tf`).

## Use

```bash
cp -r ~/devops-cloud_tools/templates/terraform/cloudflare-worker/ ~/my-binding/
cd ~/my-binding/
export CLOUDFLARE_API_TOKEN=...
cp terraform.tfvars.example terraform.tfvars   # fill account_id / zone_id / hostname / worker_name
terraform init && terraform plan
```

## Notes / gotchas

- **`environment`** on the custom domain is **deprecated** in the provider/API. Do
  not set it.
- If you manage the Worker **script in TF and also deploy via wrangler/CI**, add a
  `lifecycle { ignore_changes = [...] }` so TF does not revert pipeline deploys
  (see the commented block in `main.tf`).
- The Worker **script upload** (content/module) has more involved args, see the
  [provider docs](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/workers_script).
- Schema verified against the official provider docs, but **pin and check your
  provider version**, the Cloudflare provider changed a lot in v5.
- See [`scripts/cloudflare/RUNBOOK.md`](../../../scripts/cloudflare/RUNBOOK.md) for
  the full cutover/rollback procedure.
