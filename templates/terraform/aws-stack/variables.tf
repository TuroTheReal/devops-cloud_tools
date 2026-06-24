# Input variables: the knobs of the stack. Values come from terraform.tfvars,
# -var flags, or env vars (TF_VAR_*).

variable "project_name" {
  description = "Project / stack name, used in tags and resource naming."
  type        = string
  default     = "CHANGE_ME"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "region" {
  description = "AWS region."
  type        = string
  default     = "eu-west-3"
}
