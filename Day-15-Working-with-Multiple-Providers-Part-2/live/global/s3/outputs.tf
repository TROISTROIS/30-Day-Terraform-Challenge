output "s3-bucket-name" {
  description = "The name of the s3 state bucket"
  value = module.s3_backend.state-s3-bucket-name
}

output "dynamodb-state-table" {
    description = "The name of the state Dynamoddb table"
    value = module.s3_backend.state-dynamodb-table
}