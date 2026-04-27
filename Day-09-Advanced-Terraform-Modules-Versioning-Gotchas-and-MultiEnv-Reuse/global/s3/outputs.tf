output "arn_backend_s3_bucket" {
  description = "The s3 bucket containing the remote state"
  value = aws_s3_bucket.terraform_state_bucket.arn
}

output "dynamodb_table_name" {
    description = "The name of the dynamodb table"
    value = aws_dynamodb_table.terraform_locks.name
}