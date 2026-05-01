output "dev_ARN" {
    description = "The ARN of the IAM user dev"
    value = aws_iam_user.IAMuser[0].arn
}

output "all_ARNs" {
  description = "The ARNs of all of the IAM users"
  value = aws_iam_user.IAMuser[*].arn
}