data "aws_region" "region_1" {
    provider = aws.region1
}

data "aws_region" "region_2" {
    provider = aws.region2
}

data "aws_ami" "ubuntu_region1" {
    provider = aws.region1

    most_recent = true
    owners = ["099720109477"]

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-24.04-amd64-server-*"]
    }
}

data "aws_ami" "ubuntu_region2" {
    provider = aws.region2

    most_recent = true
    owners = ["099720109477"]

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-24.04-amd64-server-*"]
    }
}