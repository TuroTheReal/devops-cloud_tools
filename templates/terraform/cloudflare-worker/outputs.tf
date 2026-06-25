# The durable binding is the custom domain (see main.tf).

output "custom_domain_id" {
  description = "Immutable ID of the Worker custom domain."
  value       = cloudflare_workers_custom_domain.this.id
}

# If you use the permanent route block instead, output its id:
# output "route_id" {
#   value = cloudflare_workers_route.this.id
# }
