output "public_ip" {
    value = aws_instance.day03_demo.public_ip
    description = "The Web server's public IP address"
}