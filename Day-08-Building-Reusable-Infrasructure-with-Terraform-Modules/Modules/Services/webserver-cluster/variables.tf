variable "cluster_name" {
    description = "The name to use for cluster resources"
    type = string
}

variable "db_remote_state_bucket" {
    description = "The name of the s3 bucket for the DB's remote state"
    type = string
}

variable "db_remote_state_key" {
    description = "The path to the DB's remote state in S3"
    type = string
}

variable "port_number" {
    description = "The port number on which the Web Server is listening"
    type = number
    default = 8080
}

variable "instance_type" {
    description = "The type of ec2 instances to run"
    type = string 
}