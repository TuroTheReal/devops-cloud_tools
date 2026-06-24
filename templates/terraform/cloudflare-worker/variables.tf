variable "cloudflare_api_token" {
  description = "Cloudflare API token. Prefer the CLOUDFLARE_API_TOKEN env var; leave empty to use it."
  type        = string
  default     = ""
  sensitive   = true
}

variable "account_id" {
  description = "Cloudflare account id."
  type        = string
}

variable "zone_id" {
  description = "Zone id of the hostname's domain."
  type        = string
}

variable "hostname" {
  description = "Hostname to route to the Worker (e.g. app.example.com)."
  type        = string
}

variable "worker_name" {
  description = "Name of the already-deployed Worker to route the hostname to."
  type        = string
}

variable "route_pattern" {
  description = "Route pattern, only for Strategy B (e.g. app.example.com/*)."
  type        = string
  default     = ""
}
