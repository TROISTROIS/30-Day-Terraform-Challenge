provider "aws" {
  region  = "us-east-1"
  alias   = "parent"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "child"

  assume_role {
    role_arn = "arn:aws:iam::966392475043:role/CrossAccountRole"
  }
}