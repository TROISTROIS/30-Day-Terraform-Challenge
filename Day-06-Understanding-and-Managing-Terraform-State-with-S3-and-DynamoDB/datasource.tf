data "aws_iam_policy_document" "lambda-role" {
    statement {
      effect = "Allow"
      principals {
        type = "Service"
        identifiers = ["lambda.amazon.aws"]
      }
      actions = ["sts.AssumeRole"]
    }
}

