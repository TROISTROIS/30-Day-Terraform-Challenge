provider "aws" {
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
}

module "webserver_cluster" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/webserver?ref=v0.4.8"
    VPC_name = "Day11-Prod"
    VPC_CIDR = "10.0.0.0/24"
    AZs = 2
    newbits = 4
    subnet_count = 4
    EC2AMI = "ami-0ec10929233384c7f"
    minServers = 2
    maxServers = 5
    Environment = "Production"
    enable_autoscaling = false
}