provider "aws" {
    profile = "profile"
    region = "us-east-1"
}

module "webserver" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//services/webserver?ref=v0.0.4"

    VPC_name = "Day9-Prod"
    VPC_CIDR = "10.1.0.0/16"
    Subnet1_CIDR = "10.1.0.0/24"
    Subnet2_CIDR = "10.1.1.0/24"
    Subnet3_CIDR = "10.1.2.0/24"
    Subnet4_CIDR = "10.1.3.0/24"
    EC2AMI = "ami-0ec10929233384c7f"
    minServers = 2
    maxServers = 5
    InstanceType = "t2.micro"
    Environment = "Prod"
}

# In production, use a schedule to scale the servers
resource "aws_autoscaling_schedule" "scale_out" {
    scheduled_action_name = var.scale_out
    min_size = 1
    max_size = 4
    desired_capacity = 4
    recurrence = "50 10 * * *"
    autoscaling_group_name = module.webserver.ASG_name
}

resource "aws_autoscaling_schedule" "scale_in" {
    scheduled_action_name = var.scale_in
    min_size = 1
    max_size = 4
    desired_capacity = 1
    recurrence = "10 11 * * *"
    autoscaling_group_name = module.webserver.ASG_name
}

