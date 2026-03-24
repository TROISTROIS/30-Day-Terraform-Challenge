resource "aws_vpc" "Day4VPC" {
    cidr_block = var.VPC_CIDR
    tags = {
        Name = "Day4-VPC"
    }
}

resource "aws_subnet" "Day4_Subnet1" {
    availability_zone = data.aws_availability_zones.available.names[0]
    cidr_block = var.Subnet1_CIDR
    vpc_id = aws_vpc.Day4VPC.id
    map_public_ip_on_launch = true
    tags = {
        Name = "Day4-Subnet1"
    }
}

resource "aws_subnet" "Day4_Subnet2" {
    availability_zone = data.aws_availability_zones.available.names[1]
    vpc_id = aws_vpc.Day4VPC.id
    cidr_block = var.Subnet2_CIDR
    map_public_ip_on_launch = true
    tags = {
        Name = "Day4-Subnet2"
    }
}

resource "aws_subnet" "Day4_Subnet3" {
    availability_zone = data.aws_availability_zones.available.names[0]
    cidr_block = var.Subnet3_CIDR
    vpc_id = aws_vpc.Day4VPC.id
    map_public_ip_on_launch = true
    tags = {
        Name = "Day4-Subnet3"
    }
}

resource "aws_subnet" "Day4_Subnet4" {
    availability_zone = data.aws_availability_zones.available.names[1]
    vpc_id = aws_vpc.Day4VPC.id
    cidr_block = var.Subnet4_CIDR
    map_public_ip_on_launch = true
    tags = {
        Name = "Day4-Subnet4"
    }
}

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.Day4VPC.id
    tags = {
        Name = "Day4-IGW"
    }
}

resource "aws_route_table" "PublicRouteTable_Day4" {
    vpc_id = aws_vpc.Day4VPC.id
}

resource "aws_route" "Day4_Route" {
    route_table_id = aws_route_table.PublicRouteTable_Day4.id
    destination_cidr_block = var.IGW_destination_IP
    gateway_id = aws_internet_gateway.IGW.id
}

resource "aws_route_table_association" "ELB_Subnet1" {
  subnet_id      = aws_subnet.Day4_Subnet1.id
  route_table_id = aws_route_table.PublicRouteTable_Day4.id
}

resource "aws_route_table_association" "ELB_Subnet2" {
  subnet_id      = aws_subnet.Day4_Subnet2.id
  route_table_id = aws_route_table.PublicRouteTable_Day4.id
}

resource "aws_route_table_association" "ASG_Subnet1" {
  subnet_id      = aws_subnet.Day4_Subnet3.id
  route_table_id = aws_route_table.PublicRouteTable_Day4.id
}

resource "aws_route_table_association" "ASG_Subnet2" {
  subnet_id      = aws_subnet.Day4_Subnet4.id
  route_table_id = aws_route_table.PublicRouteTable_Day4.id
}

resource "aws_security_group" "ELB_sg" {
    description = "ELB security group"
    name = var.ELB_sg
    vpc_id = aws_vpc.Day4VPC.id
    tags = {
        Name = "Day4-ELB-sg"
    }
}

resource "aws_vpc_security_group_ingress_rule" "ELB_sg_ingress" {
    description = "ELB Security Group Ingress"
    cidr_ipv4 = var.IGW_destination_IP
    from_port = var.ELB_Port
    to_port = var.ELB_Port
    ip_protocol = "tcp"
    security_group_id = aws_security_group.ELB_sg.id
    tags = {
        Name = "Day4-ELB-Ingress"
    }
}

resource "aws_vpc_security_group_egress_rule" "ELB_sg_egress" {
  security_group_id = aws_security_group.ELB_sg.id
  cidr_ipv4 = var.IGW_destination_IP
  ip_protocol = "-1"
}

resource "aws_security_group" "EC2_sg" {
    description = "Security group for the instances"
    vpc_id = aws_vpc.Day4VPC.id
    name = "EC2-SG"
    tags = {
        Name = "Day4-EC2-sg"
    }
}

resource "aws_vpc_security_group_ingress_rule" "EC2_sg_ingress" {
    description = "EC2 Security Group Ingress"
    referenced_security_group_id = aws_security_group.ELB_sg.id
    from_port = var.Server_Port
    to_port = var.Server_Port
    ip_protocol = "tcp"
    security_group_id = aws_security_group.EC2_sg.id
    tags = {
        Name = "Day4-ELB-Ingress"
    }
}


resource "aws_lb" "ELB" {
    subnets = [aws_subnet.Day4_Subnet1.id,aws_subnet.Day4_Subnet2.id]
    security_groups = [aws_security_group.ELB_sg.id]
    name = "ELB-Day4"
    tags = {
        Name = "Day4-ELB"
    }
}

resource "aws_lb_target_group" "LBTargetGroup" {
    name = var.Target_Group
    port = var.Server_Port
    protocol = "HTTP"
    vpc_id = aws_vpc.Day4VPC.id

    health_check {
        path = "/"
        protocol = "HTTP"
        healthy_threshold   = 2
        unhealthy_threshold = 5
        timeout = 3
        interval = 15
        matcher = "200"
    }
    tags = {
        Name = "Day4-LBTargetGroup"
    }
}

resource "aws_lb_listener" "ELB_Listener" {
  load_balancer_arn = aws_lb.ELB.arn
  port              = var.ELB_Port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.LBTargetGroup.arn
  }
}

resource "aws_lb_listener_rule" "ELB_Listener_rule" {
    listener_arn = aws_lb_listener.ELB_Listener.arn
    priority = 100

    condition {
        path_pattern {
          values = ["*"]
        }
    }

    action {
      type = "forward"
      target_group_arn = aws_lb_target_group.LBTargetGroup.arn
    }
}

resource "aws_vpc_security_group_egress_rule" "ELB_to_EC2" {
  security_group_id = aws_security_group.ELB_sg.id
  referenced_security_group_id = aws_security_group.EC2_sg.id
  from_port = var.Server_Port
  to_port = var.Server_Port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "EC2_allow_all_outbound" {
  security_group_id = aws_security_group.EC2_sg.id
  cidr_ipv4 = var.IGW_destination_IP
  ip_protocol = "-1"
}

resource "aws_launch_template" "AMI" {

    name_prefix = "AMI-"
    image_id = var.EC2AMI
    instance_type = var.InstanceType

    network_interfaces {
        associate_public_ip_address = true
        security_groups = [aws_security_group.EC2_sg.id]
    }

    user_data = base64encode(<<-EOF
                #!/bin/bash
                echo "Yaay! Welcome to my web server. I just Completed Day 04 of the Terraform Challenge." > index.html
                nohup busybox httpd -f -p ${var.Server_Port} &
                EOF
    )

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "ASG" {
    name = var.ASG
    max_size = var.maxServers
    min_size = var.minServers
    vpc_zone_identifier = [aws_subnet.Day4_Subnet3.id, aws_subnet.Day4_Subnet4.id]
    
    launch_template {
        id = aws_launch_template.AMI.id
        version = "$Latest"
    }
    target_group_arns = [aws_lb_target_group.LBTargetGroup.arn]
    health_check_type = "ELB"
    health_check_grace_period = 300
    tag {
        key = "Name"
        value = "Day4-ASG"
        propagate_at_launch = true
    }
}