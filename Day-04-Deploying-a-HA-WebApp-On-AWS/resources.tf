resource "aws_vpc" "Day4VPC" {
    region = data.aws_region.current.name
    cidr_block = var.VPC_CIDR
    tags = {
        Name = "Day-04-VPC"
    }
}

resource "aws_subnet" "Day4-Subnet1" {
    availability_zone = data.aws_availability_zones.available.names[0]
    cidr_block = var.Subnet1_CIDR
    vpc_id = aws_vpc.Day4VPC.id
    map_public_ip_on_launch = true
    tags = {
        Name = "Day01-Subnet1"
    }
}

resource "aws_subnet" "Day4-Subnet2" {
    availability_zone = data.aws_availability_zones.available.names[1]
    vpc_id = aws_vpc.Day4VPC.id
    cidr_block = var.Subnet2_CIDR
    map_public_ip_on_launch = true
    tags = {
        Name = "Day04-Subnet2"
    }
}

resource "aws_subnet" "Day4-Subnet3" {
    availability_zone = data.aws_availability_zones.available.names[2]
    cidr_block = var.Subnet1_CIDR
    vpc_id = aws_vpc.Day4VPC.id
    map_public_ip_on_launch = true
    tags = {
        Name = "Day01-Subnet3"
    }
}

resource "aws_subnet" "Day4-Subnet4" {
    availability_zone = data.aws_availability_zones.available.names[3]
    vpc_id = aws_vpc.Day4VPC.id
    cidr_block = var.Subnet2_CIDR
    map_public_ip_on_launch = true
    tags = {
        Name = "Day04-Subnet4"
    }
}
