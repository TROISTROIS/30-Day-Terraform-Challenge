provider "aws" {
    region= "us-east-1"
}

module "webserver_cluster" {

source = "github.com/TROISTROIS/30-day-terraform-modules.git//backend?ref=v0.7.4"

s3-backend-bucket = "day-14-bucket-zn"
dynamodb-backend-table = "day-14-dynamodb"

}