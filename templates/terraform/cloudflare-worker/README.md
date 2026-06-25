# Cloudflare Worker hostname binding (Terraform template)

A **static** template to point a hostname at an **already-deployed** Cloudflare
Worker, the Terraform way. The IaC equivalent of the cutover scripts in
[`scripts/cloudflare/`](../../../scripts/cloudflare/). Copy it, fill the
placeholders.

## Two strategies (pick one)

| Strategy | Resource | When |
| --- | --- | --- |
| **Custom Domain** | `cloudflare_workers_custom_domain` | host is Cloudflare-managed, you want a real custom domain. Touches DNS. |
| **Worker Route** | `cloudflare_workers_route` | gap-free, but a **transient cutover bridge**: add it, cut over, then delete it. Manage it with the runbook scripts, not TF. |

`main.tf` ships the **custom domain** (durable binding) active. The route is the
**bridge** you use during cutover via the runbook scripts, not a TF-managed
resource. This template is the "IaC reconcile" end-state of the runbook.

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
