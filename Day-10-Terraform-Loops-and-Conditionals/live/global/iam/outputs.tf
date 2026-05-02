# output "dev_ARN" {
#     description = "The ARN of the IAM user dev"
#     value = module.IAMusers[0].IAMuser_arn
# }

# output "all_ARNs" {
#   description = "The ARNs of all of the IAM users"
#   value = module.IAMusers[*].IAMuser_arn
# }

# output "IAMusers" {
#   value = aws_iam_user.IAMusers
#   description = "All the 3 IAM users"
# }

# output "all_arns" {
#   value = values(aws_iam_user.IAMusers)[*].arn
#   description = "The ARNs of the three IAM users"
# }

output "dev_ARN" {
  description = "The ARN of the IAM user dev "
  value = values(module.IAMusers)[0].IAMuser_arn
}

output "allARNs" {
  description = "The ARN of all IAM users"
  value = values(module.IAMusers)[*].IAMuser_arn
}
