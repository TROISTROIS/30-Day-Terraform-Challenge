data "aws_iam_policy_document" "lambda_role" {
    statement {
      effect = "Allow"
      principals {
        type = "Service"
        identifiers = ["lambda.amazonaws.com"]
      }
      actions = ["sts:AssumeRole"]
    }
}

data "archive_file" "lambda_script" {
    type = "zip"
    source_file = "helloworld.py"
    output_path = "function.zip"
}

