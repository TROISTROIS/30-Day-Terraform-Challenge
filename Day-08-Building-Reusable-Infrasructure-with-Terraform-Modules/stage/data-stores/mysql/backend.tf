terraform {
    backend "s3" {
        bucket = "backend-bucket-zn"
        key = "stage/data-stores/mysql/terraform.tfstate"
        region = "us-east-1"
        use_lockfile = true
        profile = "IAMAdmin-GEN"
        encrypt = true
    }
}