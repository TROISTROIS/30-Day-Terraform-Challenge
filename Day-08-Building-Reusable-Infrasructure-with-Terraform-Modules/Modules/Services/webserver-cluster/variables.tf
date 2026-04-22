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