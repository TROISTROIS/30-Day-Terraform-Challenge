provider "aws" {
    region = "us-east-1"
    profile = "IAMAdmin-GEN"
}

module "DB-instance" {
    source = "../../../Modules/DataStores/mysql"

    db_engine = "mysql"
    db_identifier = "demoday8"
    db_name = "DBday8"
    instance_class = "db.t3.micro"
    db_username = var.db_username
    db_password = var.db_password
}