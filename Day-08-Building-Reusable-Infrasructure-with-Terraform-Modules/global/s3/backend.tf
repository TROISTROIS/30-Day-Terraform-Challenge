terraform {
    backend "s3" {
        bucket = "backend-bucket-zn"
        key = "global/s3/terraform.tfstate"
        region = "us-east-1"
        use_lockfile = true
        profile = "IAMAdmin-GEN"
        encrypt = true
    }
}