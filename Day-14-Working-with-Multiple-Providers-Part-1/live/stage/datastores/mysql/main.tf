provider "aws" {
  region = "us-east-1"
  alias = "primary"
}

module "RDS_instance_stage" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/datasources/mysql?ref=v0.7.4"

    providers = { 
        aws = aws.primary
    }
    
    environment = "stage"
    prefix = "day14-stage"

    backup_retention_period = 1

    dbname = "stage_db"
    RDS_engine = "mysql"
    db_username = local.creds.username
    db_password = local.creds.password
}