# Point a hostname at an already-deployed Cloudflare Worker.
# Two strategies (same as the cutover scripts in scripts/cloudflare/). Pick one.

# --- Strategy A: Custom Domain (Cloudflare-managed, touches DNS) ---
resource "cloudflare_workers_custom_domain" "this" {
  account_id = var.account_id
  hostname   = var.hostname
  service    = var.worker_name
  zone_id    = var.zone_id
  # NOTE: `environment` exists but is DEPRECATED in the provider/API. Do not set it.
}

# --- Strategy B: Worker Route (no DNS change) ---
# Comment out Strategy A above and use this instead if you prefer a route.
# resource "cloudflare_workers_route" "this" {
#   zone_id = var.zone_id
#   pattern = var.route_pattern # e.g. "app.example.com/*"
#   script  = var.worker_name
# }

# --- Optional: manage the Worker script itself in Terraform ---
# Usually the Worker is deployed via wrangler/CI, not here. Uncomment to manage it
# in TF. The content/module args depend on your worker, see the provider docs:
# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/workers_script
# resource "cloudflare_workers_script" "this" {
#   account_id         = var.account_id
#   script_name        = var.worker_name
#   content            = file("${path.module}/worker.js")
#   main_module        = "worker.js"
#   compatibility_date = "2025-01-01"
# }
