terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

variable "region" {
  description = "AWS region for the provider."
  type        = string
  default     = "us-east-1"
}

provider "aws" {
  region = var.region
}

module "sso" {
  source = "../.."

  name             = "example-readonly"
  description      = "Read-only access"
  session_duration = "PT2H"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]

  tags = {
    ManagedBy = "terraform"
  }
}

output "permission_set_arn" {
  value = module.sso.arn
}
