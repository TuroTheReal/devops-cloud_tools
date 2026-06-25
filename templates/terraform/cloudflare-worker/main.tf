# Durable IaC binding: point a hostname at an already-deployed Cloudflare Worker
# via a Worker Custom Domain. This is the "IaC reconcile" end-state of the cutover
# runbook (see ../../../scripts/cloudflare/RUNBOOK.md).

resource "cloudflare_workers_custom_domain" "this" {
  account_id = var.account_id
  hostname   = var.hostname
  service    = var.worker_name
  zone_id    = var.zone_id
  # NOTE: `environment` exists but is DEPRECATED in the provider/API. Do not set it.
}

# --- Worker Route: the cutover BRIDGE, not a durable binding ---
# A route is gap-free but transient: you add it to cut over, then delete it once
# the custom domain above owns the host. Manage that lifecycle with the runbook
# scripts (cutover-worker-route.sh / rollback-worker-route.sh), NOT in Terraform
# (TF would create-then-destroy it). Declare it here only if you truly want a
# permanent route instead of a custom domain:
# resource "cloudflare_workers_route" "this" {
#   zone_id = var.zone_id
#   pattern = var.route_pattern # e.g. "app.example.com/*"
#   script  = var.worker_name
# }

# --- Optional: manage the Worker script itself in Terraform ---
# Usually the Worker is deployed out-of-band (wrangler / CI), not here. If you DO
# manage it in TF *and* still deploy via wrangler/CI, add a lifecycle block so TF
# does not revert those deploys (ignore the attributes the pipeline owns).
# Content/module args depend on your worker, see the provider docs:
# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/workers_script
# resource "cloudflare_workers_script" "this" {
#   account_id         = var.account_id
#   script_name        = var.worker_name
#   content            = file("${path.module}/worker.js")
#   main_module        = "worker.js"
#   compatibility_date = "2025-01-01"
#
#   lifecycle {
#     # Let wrangler/CI own the code; TF owns existence + metadata only.
#     ignore_changes = [content] # adjust to whatever your pipeline deploys
#   }
# }
