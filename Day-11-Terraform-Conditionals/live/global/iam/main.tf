provider "aws" {
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
}


resource "aws_iam_policy" "cloudwatch_read_only" {
    name   = "cloudwatch-read-only"
    policy = data.aws_iam_policy_document.cloudwatch_read_only_policy.json
}

data "aws_iam_policy_document" "cloudwatch_read_only_policy" {
    statement {
        effect = "Allow"
        actions = [
            "cloudwatch:Describe*",
            "cloudwatch:Get*",
            "cloudwatch:List*"
        ]
        resources = ["*"]
    }
}

resource "aws_iam_policy" "cloudwatch_full_access" {
    name   = "cloudwatch-full-access"
    policy = data.aws_iam_policy_document.cloudwatch_full_access_policy.json
}

data "aws_iam_policy_document" "cloudwatch_full_access_policy" {
    statement {
        effect    = "Allow"
        actions   = ["cloudwatch:*"]
        resources = ["*"]
    }
}

module "IAMusers" {
    source = "github.com/TROISTROIS/30-day-terraform-modules.git//landing-zone/iam-user?ref=v0.4.7"
    for_each = toset(var.user_names)
    user_name = each.value
    give_dev_cloudwatch_full_access = true
    cloudwatch_read_only_arn        = aws_iam_policy.cloudwatch_read_only.arn
    cloudwatch_full_access_arn      = aws_iam_policy.cloudwatch_full_access.arn
}