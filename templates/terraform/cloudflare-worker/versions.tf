# Terraform + Cloudflare provider pins.

terraform {
  required_version = ">= 1.5"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0" # check latest: https://registry.terraform.io/providers/cloudflare/cloudflare/latest
    }
  }

  # State has to live somewhere. Example S3 backend (uncomment + fill):
  # backend "s3" {
  #   bucket       = "CHANGE_ME-terraform-state"
  #   key          = "cloudflare/CHANGE_ME/terraform.tfstate"
  #   region       = "eu-west-3"
  #   encrypt      = true
  #   use_lockfile = true
  # }
}
