output "parent_account" {
value = data.aws_caller_identity.parent.account_id
description = "The ID of the parent AWS account"
}
output "child_account" {
value = data.aws_caller_identity.child.account_id
description = "The ID of the child AWS account"
}