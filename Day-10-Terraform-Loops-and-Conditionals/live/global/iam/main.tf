provider "aws" {
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
}

resource "aws_iam_user" "IAMuser" {
    count = length(var.user_names)
    name = var.user_names[count.index]
}
