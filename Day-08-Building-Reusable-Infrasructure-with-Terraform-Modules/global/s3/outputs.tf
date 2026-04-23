output "backend_s3_bucket_arn" {
    value = aws_s3_bucket.terraform_state_bucket.arn
    description = "S3 Backend bucket arn"
}

output "dynamodb_table_name" {
    value = aws_dynamodb_table.terraform_locks.name
    description = "DynamoDB table backend name"
}