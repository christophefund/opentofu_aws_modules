#------------------------------------------------------------------------------
# Configure the Required Versions for Terraform and Providers
#------------------------------------------------------------------------------
terraform {

  required_version = "~> 1.10.7" # 2025.11 (Terraform 1.13.4, OpenTofu 1.10.7)

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.22.1"      # 2025.11
    }
  }
}