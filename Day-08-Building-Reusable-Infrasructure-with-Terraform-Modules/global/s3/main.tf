provider "aws" {
    region = "us-east-1"
    profile = "IAMAdmin-GEN" 
}

#  1. create s3 bucket
resource aws_s3_bucket "terraform_state_bucket" {
    bucket = "backend-bucket-zn"
    force_destroy = true
    # prevent accidental deletion of this bucket
    lifecycle {
        prevent_destroy = false
    }
}

# 2. add extra layers of security to the bucket with versioning
resource "aws_s3_bucket_versioning" "enabled" {
    bucket = aws_s3_bucket.terraform_state_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

# 3. turn on SSE for data written to this bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
    bucket = aws_s3_bucket.terraform_state_bucket.id

    rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
    }
}

# 4. Block public access on the S3 bucket
resource "aws_s3_bucket_public_access_block" "public_access" {
    bucket = aws_s3_bucket.terraform_state_bucket.id
    block_public_acls = true
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true
}

# create a DynamoDB table to use for locking 
resource "aws_dynamodb_table" "terraform_locks" {
    name = "backend-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
}