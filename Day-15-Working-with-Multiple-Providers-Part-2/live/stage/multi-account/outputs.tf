output "stage_account" {
value = module.multi-account.stage_account
description = "The ID of the parent AWS account"
}

output "prod_account" {
value = module.multi-account.prod_account
description = "The ID of the child AWS account"
}