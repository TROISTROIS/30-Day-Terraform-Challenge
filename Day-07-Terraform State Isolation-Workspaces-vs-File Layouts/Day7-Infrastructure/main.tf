terraform {
    backend "s3" {
        bucket = "backend-bucket-zn"
        key = "global/s3/terraform.tfstate"
        region = "us-east-1"
        use_lockfile = true
        profile = "general"
        encrypt = true
    }
}

# create s3 bucket
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_s3_bucket" "bucket" {
    bucket = format("day-7-bucket-%s-%s-an", data.aws_caller_identity.current.account_id, data.aws_region.current.name)
    bucket_namespace = "account-regional"
}
