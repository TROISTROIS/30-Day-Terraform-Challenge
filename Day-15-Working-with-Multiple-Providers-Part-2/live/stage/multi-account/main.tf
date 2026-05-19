provider "aws" {
  region  = "us-east-1"
  alias   = "stage"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "prod"

  assume_role {
    role_arn = "arn:aws:iam::${local.accountID}:role/CrossAccountRole"
  }
}

module "multi-account" {
  source = "../../../../../modules/multi-account"
  providers = {
    aws.stage = aws.stage
    aws.prod = aws.prod
  }
}