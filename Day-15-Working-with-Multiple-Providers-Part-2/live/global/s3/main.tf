provider "aws" {
    region= "us-east-1"
}

module "s3_backend" {

source = "github.com/TROISTROIS/30-day-terraform-modules.git//backend?ref=v0.7.4"

s3-backend-bucket = "bucket"
dynamodb-backend-table = "dynamodb"

}