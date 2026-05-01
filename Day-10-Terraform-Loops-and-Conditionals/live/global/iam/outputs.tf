output "dev_ARN" {
    description = "The ARN of the IAM user dev"
    value = module.IAMusers[0].IAMuser_arn
}

output "all_ARNs" {
  description = "The ARNs of all of the IAM users"
  value = module.IAMusers[*].IAMuser_arn
}