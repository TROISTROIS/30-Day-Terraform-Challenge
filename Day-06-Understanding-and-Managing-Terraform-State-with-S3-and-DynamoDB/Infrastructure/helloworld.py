def lambda_handler(event, context):
    message = "Hello world! Welcome to Day 6 of the Terraform Challenge"
    print(message)
    return {
        'statusCode': 200,
        'body': message
    }