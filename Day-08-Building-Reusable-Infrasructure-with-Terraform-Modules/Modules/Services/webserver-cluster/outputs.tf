output "public_ip" {
    value = aws_instance.day08_server.public_ip
    description = "The Web server's public IP address"
}
