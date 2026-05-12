terraform {
    backend "s3" {
        key = "live/prod/services/datasources/mysql/terraform.tfstate"
    }
}