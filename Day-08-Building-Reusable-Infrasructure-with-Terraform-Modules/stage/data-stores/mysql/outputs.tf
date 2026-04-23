output "address" {
    value = module.DB-instance.address
    description = "Connect to the database at this endpoint"
}

output "port" {
    value = module.DB-instance.port
    description = "The port the database is listening on"
}