resource "aws_instance" "day08_server" {
    ami = "ami-0ec10929233384c7f"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.alb.id]

    user_data = templatefile("${path.module}/user-data.sh", {
        server_port = var.port_number
        db_address = data.terraform_remote_state.db.outputs.address
        db_port = data.terraform_remote_state.db.outputs.port
    })

    user_data_replace_on_change = true

    tags = {
        Name = "WebServer"
    }
}

resource "aws_security_group" "alb" {
    name = "${var.cluster_name}-alb"

    ingress {
        from_port = local.http_port
        to_port = local.http_port
        protocol = local.tcp_protocol
        cidr_blocks = local.all_ips
    }

    egress {
        from_port = local.any_port
        to_port = local.any_port
        protocol = local.any_protocol
        cidr_blocks = local.all_ips
    }
}

