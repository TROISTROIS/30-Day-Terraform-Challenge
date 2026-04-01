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

provider "aws" {
profile = "general"
}

resource "aws_db_instance" "example" {
identifier_prefix = "terraform-up-and-running"
engine = "mysql"
allocated_storage = 10
instance_class = "db.t3.micro"
skip_final_snapshot = true
db_name = "example_database"
username = var.db_username
password = var.db_password
}