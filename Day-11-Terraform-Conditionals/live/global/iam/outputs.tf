output "dev_ARN" {
  description = "The ARN of the IAM user dev "
  value = values(module.IAMusers)[0].dev_cloudwatch_policy_arn
}

output "allARNs" {
  description = "The ARN of all IAM users"
  value = values(module.IAMusers)[*].IAMuser_arn
}

output "for_directive_index_if_else_strip" {
  value = <<EOF
  %{~ for i, name in var.user_names ~}
  ${name}%{if i < length(var.user_names) - 1}, %{ else }.%{ endif }
  %{~ endfor ~}
  EOF
}
