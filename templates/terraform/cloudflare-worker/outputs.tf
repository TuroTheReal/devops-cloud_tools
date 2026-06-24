# Outputs for Strategy A (custom domain). Adjust if you switch to Strategy B.

output "custom_domain_id" {
  description = "Immutable ID of the Worker custom domain."
  value       = cloudflare_workers_custom_domain.this.id
}

# output "route_id" {
#   value = cloudflare_workers_route.this.id
# }
