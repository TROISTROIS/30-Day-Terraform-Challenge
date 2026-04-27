terraform {
    backend "s3" {
        bucket = "s3-backend-91-bucket"
        key = "global/s3/terraform.tfstate"
        region = "us-east-1"
        profile = "IAMAdmin-GEN"
        dynamodb_table = "dynamodb-remote-backend"
        encrypt = true
    }
}