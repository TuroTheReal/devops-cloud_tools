# Terraform + provider version pins, and remote state backend.
# Pinning versions keeps `terraform init` reproducible across machines and CI.

terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # check latest: https://registry.terraform.io/providers/hashicorp/aws/latest
    }
  }

  # Remote state in S3. One stack = one state file (one unique `key`).
  # `use_lockfile` is native S3 state locking (Terraform >= 1.10), it replaces
  # the old DynamoDB lock table. Fill the placeholders, then run `terraform init`.
  backend "s3" {
    bucket       = "CHANGE_ME-terraform-state"
    key          = "CHANGE_ME/terraform.tfstate"
    region       = "eu-west-3"
    encrypt      = true
    use_lockfile = true
  }
}
