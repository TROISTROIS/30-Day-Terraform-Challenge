provider "aws" {
    profile = "IAMAdmin-GEN"
    region= "us-east-1"
}

module "webserver_cluster" {

source = "github.com/TROISTROIS/30-day-terraform-modules.git//backend?ref=v0.5.0"

s3-backend-bucket = "day-12-bucket"
dynamodb-backend-table = "day-12-dynamodb"

}