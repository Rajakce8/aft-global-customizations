terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Get current account information
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Simple verification outputs
output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "Current account ID where customizations are applied"
}

output "region" {
  value       = data.aws_region.current.name
  description = "Current region"
}

output "aft_timestamp" {
  value       = timestamp()
  description = "Timestamp when AFT applied these customizations"
}

# Note: This is a minimal baseline
# Control Tower already enables CloudTrail, Config, and GuardDuty
# We're just adding a verification marker