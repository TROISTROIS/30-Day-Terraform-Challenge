provider "aws" {
    region = "us-east-1"
    profile = "profile"
}

module "webserver" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/webserver?ref=v0.0.4"

    VPC_name = "Day9-Stage"
    VPC_CIDR = "10.0.0.0/16"
    Subnet1_CIDR = "10.0.0.0/24"
    Subnet2_CIDR = "10.0.1.0/24"
    Subnet3_CIDR = "10.0.2.0/24"
    Subnet4_CIDR = "10.0.3.0/24"
    EC2AMI = "ami-0ec10929233384c7f"
    minServers = 2
    maxServers = 5
    InstanceType = "t2.nano"
    Environment = "Stage"
}