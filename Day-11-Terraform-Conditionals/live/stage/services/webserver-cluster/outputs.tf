output "LB_DNS" {
    description = "Load Balancer DNS"
    value = module.webserver_cluster.LoadBalancerDNS
}

output "region" {
    description = "The region my infra is deployed in"
    value = module.webserver_cluster.region
}


output "ASG" {
    description = "The name of the Auto Scaling Group"
    value = module.webserver_cluster.ASG_name
}