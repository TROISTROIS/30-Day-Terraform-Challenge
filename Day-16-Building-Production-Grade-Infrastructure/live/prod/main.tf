terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  dynamic "assume_role" {
    for_each = var.environment == "Production" ? [1] : []
    content {
      role_arn = "arn:aws:iam::${local.account_ids["Production"]}:role/CrossAccountRole"
    }
  }
}

module "hello-world-app" {
  source = "../../../../modules/cluster/services/hello-world-app"
  dynamodb = var.dynamodb_name
  bucket = var.bucket_name
  subnet_count = var.subnet_count
  environment = var.environment
  maxServers = var.maxServers
  AZs = var.AZs
  day = var.day
  enable_autoscaling = local.enable_autoscaling
  minServers = var.minServers
  VPC_CIDR = local.VPC_CIDR
  newbits = var.newbits
}