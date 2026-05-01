provider "aws" {
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
}

module "IAMusers" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//landing-zone/iam-user?ref=v0.1.0"
    count = length(var.user_names)
    user_name = var.user_names[count.index]
}