output "rds_endpoint" {
    description = "The connection endpoint for the RDS instance"
    value = module.webserver_cluster.rds_endpoint
}