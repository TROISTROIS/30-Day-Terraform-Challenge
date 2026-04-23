variable "cluster_name" {
    description = "The name to use for cluster resources"
    type = string
}

variable "instance_type" {
    description = "The type of ec2 instances to run"
    type = string 
}

variable "db_endpoint" {
    description = "The RDS's endpoint to connect to"
    type = string
}

variable "db_port" {
    description = "The port the database is listening on"
    type = string
}