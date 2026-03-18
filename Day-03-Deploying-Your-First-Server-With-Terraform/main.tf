provider "aws" {
    region = "us-east-1"
    profile = "IAMAdmin-GEN"
}

variable "port_number" {
    description = "The port number on which the Web Server is listening"
    type = number
    default = 8080
}

resource "aws_instance" "day03_demo" {
    ami = "ami-0ec10929233384c7f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.day03SG.id]

    user_data = <<-EOF
                #!/bin/bash
                echo "Yaay! Welcome to my web server. I just Completed Day 03 of the Terraform Challenge." > index.html
                nohup busybox httpd -f -p ${var.port_number} &
                EOF

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

output "public_ip" {
    value = aws_instance.day03_demo.public_ip
    description = "The Web server's public IP address"
}