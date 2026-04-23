variable "db_username" {
description = "The username for the database"
type = string
sensitive = true
}

variable "db_password" {
description = "The password for the database"
type = string
sensitive = true
}

variable "db_engine" {
    description = "RDS engine"
    type = string
}

variable "db_identifier" {
    description = "The name of the RDS instance"
    type = string
}

variable "db_name" {
    description = "The name of the database created when the RDS instance created"
    type = string
}

variable "instance_class" {
  description = "RDS instance class"
  type = string
}

