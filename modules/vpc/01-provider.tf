# Terraform block
terraform {
  # required_version = ">= 0.12"  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0" # it will keep major fixed and download latest minor version
    }
  }
}

# ✅ Configure the AWS Provider
provider "aws" {
  region = var.region_name # e.g., "us-east-1" - passed as a variable

  # Apply default tags to all AWS resources
  default_tags {
    tags = {
      Application = "EKS-Cluster"
      Tool        = "Terragrunt-managed-resource"
    }
  }
}
