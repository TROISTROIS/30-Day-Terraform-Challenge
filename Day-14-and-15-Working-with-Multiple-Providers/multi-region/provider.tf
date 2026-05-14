terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
      }
    }
}

provider "aws" {
  region = "us-east-1"
  alias = "region1"
}

provider "aws" {
  region = "eu-north-1"
  alias = "region2"
}