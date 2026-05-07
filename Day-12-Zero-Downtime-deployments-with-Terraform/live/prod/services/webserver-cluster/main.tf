provider "aws" {
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
}

module "webserver_cluster" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/webserver?ref=v0.5.0"
    VPC_name = "Day11-Stage"
    VPC_CIDR = "10.0.0.0/16"
    AZs = 2
    newbits = 8
    subnet_count = 4
    day = "Day 12"
    EC2AMI = "ami-0ec10929233384c7f"
    minServers = 2
    maxServers = 5
    Environment = "Stage"
    enable_autoscaling = false
    ami = "ami-0ec10929233384c7f"
    server_text = "New Deployment !!"
}