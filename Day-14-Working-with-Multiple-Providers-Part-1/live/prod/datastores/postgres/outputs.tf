output "primary_RDS_endpoint" {
    description = "The Primary RDS Endpoint to make conncetions to"
    value = module.RDS_primary.RDS_endpoint
}

output "primary_Port" {
    description = "The port the primary database is listening on"
    value = module.RDS_primary.Port
}

output "primary_ARN" {
    description = "The ARN of the primary database"
    value = module.RDS_primary.ARN
}

output "primary_Address" {
    description = "The Address of the primary database"
    value = module.RDS_primary.Address
}

output "replica_RDS_endpoint" {
    description = "The Primary RDS Endpoint to make conncetions to"
    value = module.RDS_replica.RDS_endpoint
}

output "replica_Port" {
    description = "The port the primary database is listening on"
    value = module.RDS_replica.Port
}

output "replica_ARN" {
    description = "The ARN of the primary database"
    value = module.RDS_replica.ARN
}

output "replica_Address" {
    description = "The Address of the replica database"
    value = module.RDS_replica.Address
}