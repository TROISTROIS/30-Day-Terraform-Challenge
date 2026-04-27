provider "aws" {
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
}

module "webserver" {
    source = "../../../modules/services/webserver"

    VPC_name = "Day9"
    VPC_CIDR = "10.0.0.0/16"
    Subnet1_CIDR = "10.0.0.0/24"
    Subnet2_CIDR = "10.0.1.0/24"
    Subnet3_CIDR = "10.0.2.0/24"
    Subnet4_CIDR = "10.0.3.0/24"
    EC2AMI = "ami-0ec10929233384c7f"
    minServers = 2
    maxServers = 5
    InstanceType = "t2.medium"
}

# In production, use a schedule to scale the servers
resource "aws_autoscaling_schedule" "scale_out" {
    scheduled_action_name = var.scale_out
    min_size = 1
    max_size = 4
    desired_capacity = 4
    recurrence = "40 11 * * *"
    autoscaling_group_name = module.webserver.ASG_name
}

resource "aws_autoscaling_schedule" "scale_in" {
    scheduled_action_name = var.scale_in
    min_size = 1
    max_size = 4
    desired_capacity = 1
    recurrence = "50 11 * * *"
    autoscaling_group_name = module.webserver.ASG_name
}

