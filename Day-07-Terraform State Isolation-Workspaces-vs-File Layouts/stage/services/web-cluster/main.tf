provider "aws" {
    region = "us-east-1"
    profile = "general"
}

data "terraform_remote_state" "db" {
    backend = "s3"
    config = {
    bucket = "backend-bucket-zn"
    key = "global/s3/terraform.tfstate"
    profile = "general"
    region = "us-east-1"
    }
}

resource "aws_instance" "day03_demo" {
    ami = "ami-0ec10929233384c7f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.day03SG.id]

    user_data = templatefile("user-data.sh", {
        server_port = var.port_number
        db_address = data.terraform_remote_state.db.outputs.address
        db_port = data.terraform_remote_state.db.outputs.port
    })

    user_data_replace_on_change = true

    tags = {
        Name = "WebServer"
    }
}

resource "aws_security_group" "day03SG" {
    name = "web-server-SG"
    ingress {
        from_port = var.port_number
        to_port = var.port_number
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
