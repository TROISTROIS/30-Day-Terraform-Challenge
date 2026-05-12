provider "aws" {
    region= "us-east-1"
}

module "webserver_cluster" {

source = "github.com/TROISTROIS/30-day-terraform-modules.git//backend?ref=v0.6.0"

s3-backend-bucket = "day-13-bucket"
dynamodb-backend-table = "day-13-dynamodb"

}