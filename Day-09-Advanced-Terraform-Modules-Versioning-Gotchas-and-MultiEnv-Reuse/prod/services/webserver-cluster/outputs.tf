output "LB_DNS" {
    description = "Load Balancer DNS"
    value = module.webserver.LoadBalancerDNS
}

output "region" {
    description = "The region my infra is deployed in"
    value = module.webserver.region
}

output "AZs" {
    description = "The AZs in which the Infra is deployed in"
    value = module.webserver.AZs
}

output "ASG" {
    description = "The name of the Auto Scaling Group"
    value = module.webserver.ASG_name
}