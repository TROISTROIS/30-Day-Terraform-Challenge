output "s3_bucket_arn" {
    value = aws_s3_bucket.bucket.arn
    description = "Day 7 Demo bucket arn"
}
