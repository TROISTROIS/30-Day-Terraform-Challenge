provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/datasources/mysql?ref=v0.6.3"
    environment = "prod"
    prefix = "day13-prod"
    RDS_engine = "mysql"
    dbname = "prod-DB"
    db_username = local.creds.username
    db_password = local.creds.password
}