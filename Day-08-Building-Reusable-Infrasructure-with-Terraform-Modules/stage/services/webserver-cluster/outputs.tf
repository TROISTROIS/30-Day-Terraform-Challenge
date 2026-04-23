output "public_ip" {
    value = module.webserver-cluster.public_ip
    description = "The Web server's public IP address"
}