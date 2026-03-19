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
    default = "0.0.0.0/0"
}

variable "ELB_sg" {
    description = "ELB security group"
    type = string
    default = "ELB_sg"
}

variable "ELB_Port" {
    description = "ELB Port"
    type = number
    default = 80
}

variable "EC2_sg" {
    description = "EC2 security group"
    type = string
    default = "EC2_sg"
}

variable "Server_Port" {
    description = "EC2 Port"
    type = number
    default = 8080
}

variable "Target_Group" {
    description = "LB target group"
    type = string
    default = "LB-TargetGroup"
}

variable "EC2AMI" {
    description = "AMI for EC2 launch"
    type = string
    default = "ami-0ec10929233384c7f"
}

variable "ASG" {
    description = "Autoscaling group"
    type = string
    default = "ASG-Day4"
}

variable "minServers" {
    description = "Minimum number of servers"
    type = number
    default = 2
}

variable "maxServers" {
    description = "Maximum number of servers"
    type = number
    default = 5
}