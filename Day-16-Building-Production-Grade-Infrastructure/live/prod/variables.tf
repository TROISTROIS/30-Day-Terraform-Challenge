variable "bucket_name" {
    description = "The name of the backend S3 state bucket"
    type = string
    default = "prod-grade-infra-fn"
}

variable "dynamodb_name" {
    description = "The name of the backend Dynamodb table for state"
    type = string
    default = "prod-grade-infra-fb"
}

variable "environment" {
    description = "Environment I am working on"
    type = string

    validation {
        condition = contains(["Stage", "Production", "Test"], var.environment)
        error_message = "Environment must be Stage or Production. "
    }
}

variable "ami" {
    description = "The AMI of the EC2 instances to launch"
    type = string
    default = "ami-0ec10929233384c7f"
}

variable "server_text" {
    description = "The text the web server should return"
    type = string
    default = "Hello World from Terraform !!"
}

variable "day" {
    description = "The day of the challenge"
    type = number
    default = 16
}

variable "minServers" {
    description = "Minimum number of servers that the ASG spins up"
    type = number
    default = 3
}

variable "maxServers" {
    description = "Maximum number of servers that the ASG spins up"
    type = number
    default = 6
}

variable "newbits" {
    description = "How many bits to add to the prefix"
    type = number
    default = 8
}

variable "subnet_count" {
    description = "The number of subnets"
    type = number
    default = 4
}

variable "AZs" {
    description = "The number of AZs"
    type = number
    default = 2
}

variable custom_tags {
    description = "Custom tags to set on the instances in the ASG"
    type = map(string)
    default = {}
}

