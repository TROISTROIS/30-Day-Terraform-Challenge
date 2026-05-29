output "account_id" {
    description = "The ID of the account deploying the infrastructure"
    value = data.aws_caller_identity.current.account_id
}

output "s3-bucket" {
    description = "The name of the s3 bucket used for state remote"
    value = module.hello-world-app.state_bucket
}

output "dynamodb-table" {
    description = "The name of the dynamodb table for remote state"
    value = module.hello-world-app.state-dynamodb-table
}

output "ELB-DNS" {
    description = "The Load Balancer's DNS to access it from the internet"
    value = module.hello-world-app.ELB_DNS
}

output "ASG-name" {
    description = "The name of the Auto Scaling Group"
    value = module.hello-world-app.asg_name
}

output "LB-TargetGroup-arn" {
    description = "The arn of the Load Balancer Target Group" 
    value = module.hello-world-app.target_group_arn
}