resource "aws_db_instance" "example" {
identifier = "${var.db_identifier}-rds"
engine = var.db_engine
allocated_storage = local.storage
instance_class = var.instance_class
skip_final_snapshot = true
db_name = var.db_name
username = var.db_username
password = var.db_password
}
