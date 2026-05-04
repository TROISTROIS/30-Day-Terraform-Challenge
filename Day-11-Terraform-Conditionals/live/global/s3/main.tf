provider "aws" {
    profile = "profile"
    region= "us-east-1"
}

module "webserver_cluster" {

source = "github.com/TROISTROIS/30-day-terraform-modules.git//backend?ref=v0.2.0"

s3-backend-bucket = "bucket"
dynamodb-backend-table = "dynamodb"

}