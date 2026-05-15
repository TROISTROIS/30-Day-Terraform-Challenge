provider "aws" {
  region = "us-east-1"
  alias = "primary"
}

provider "aws" {
  region = "us-west-1"
  alias = "secondary"
}

module "RDS_primary" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/datasources/mysql?ref=v0.7.4"
    environment = "prod"
    prefix = "day14-prod"

    providers = {
      aws = aws.primary
    }

    backup_retention_period = 1

    dbname = "prod_db"
    RDS_engine = "postgres"
    db_username = local.creds.username
    db_password = local.creds.password
}

module "RDS_replica" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/datasources/mysql?ref=v0.7.4"
    environment = "prod"
    prefix = "day14-prod"

    providers = {
      aws = aws.secondary
    }

    RDS_engine = "postgres"
    replicate_source_db = module.RDS_primary.ARN
}