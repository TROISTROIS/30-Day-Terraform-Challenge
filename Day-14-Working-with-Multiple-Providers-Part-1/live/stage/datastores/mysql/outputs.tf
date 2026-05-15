output "StageDB-RDSendpoint" {
    description = "The RDS Endpoint to make conncetions to"
    value = module.RDS_instance_stage.RDS_endpoint
}

output "StageDB-Port" {
    description = "The port the database is listening on"
    value = module.RDS_instance_stage.Port
}

output "StageDB-ARN" {
    description = "The ARN of the database"
    value = module.RDS_instance_stage.ARN
}

output "StageDB-Address" {
    description = "The Address of the RDS instance"
    value = module.RDS_instance_stage.Address
}