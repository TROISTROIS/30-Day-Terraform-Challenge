variable "VPC_CIDR" {
    description = "The VPC CIDR"
    type = string
    default = "10.0.0.0/16"
}

variable "Subnet1_CIDR" {
    description = "The Subnet1 CIDR"
    type = string
    default = "10.0.0.0/24"
}

variable "Subnet2_CIDR" {
    description = "The Subnet2 CIDR"
    type = string
    default = "10.0.1.0/24"
}

variable "Subnet3_CIDR" {
    description = "The Subnet1 CIDR"
    type = string
    default = "10.0.2.0/24"
}

variable "Subnet4_CIDR" {
    description = "The Subnet2 CIDR"
    type = string
    default = "10.0.3.0/24"
}

variable "IGW_destination_IP" {
    description = "Destination of the IGW"
    type = string 
    default = "0.0.0.0./0"
}