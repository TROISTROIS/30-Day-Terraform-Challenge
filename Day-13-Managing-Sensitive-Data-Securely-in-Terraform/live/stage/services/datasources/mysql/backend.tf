terraform {
    backend "s3" {
        key = "live/stage/services/datasources/mysql/terraform.tfstate"
    }
}