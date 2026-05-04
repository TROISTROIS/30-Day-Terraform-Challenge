provider "aws" {
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
}


module "IAMusers" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//landing-zone/iam-user?ref=v0.4.4"
    for_each = toset(var.user_names)
    user_name = each.value
    give_dev_cloudwatch_full_access = false
}