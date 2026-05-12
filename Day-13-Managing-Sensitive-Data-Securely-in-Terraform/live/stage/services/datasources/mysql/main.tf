provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/datasources/mysql?ref=v0.6.3"
    environment = "stage"
    prefix = "day13-stage"
    RDS_engine = "mysql"
    dbname = "stage-DB"
    db_username = local.creds.username
    db_password = local.creds.password
}