# AWS provider. `default_tags` are applied to every taggable resource in the
# stack, so everything is tagged consistently without repeating the block.

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = var.project_name
      Env       = var.environment
      ManagedBy = "terraform"
    }
  }
}
