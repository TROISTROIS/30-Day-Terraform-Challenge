terraform {
    backend "s3" {
        bucket = "day-6-bucket-zn"
        key = "global/s3/terraform.tfstate"
        region = "us-east-1"
        use_lockfile = true
        profile = "IAMAdmin-GEN"
        encrypt = true
    }
}

resource "aws_iam_role" "IAM-role" {
    name = var.lambdarole
    assume_role_policy = data.aws_iam_policy_document.lambda_role.json
}

resource "aws_lambda_function" "lambda-Function" {
    filename = data.archive_file.lambda_script.output_path
    function_name = var.lambdafunction
    role = aws_iam_role.IAM-role.arn
    handler = "helloworld.lambda_handler"
    runtime = "python3.11"
    code_sha256   = data.archive_file.lambda_script.output_base64sha256
    tags = {
        Environment = "learning"
        Application = "Challenge-Day-6"
    }
}