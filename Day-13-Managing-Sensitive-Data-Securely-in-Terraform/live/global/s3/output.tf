output "s3-bucket-name" {
  description = "The name of the s3 state bucket"
  value = module.webserver_cluster.state-s3-bucket-name
}

output "dynamodb-state-table" {
    description = "The name of the state Dynamoddb table"
    value = module.webserver_cluster.state-dynamodb-table
}