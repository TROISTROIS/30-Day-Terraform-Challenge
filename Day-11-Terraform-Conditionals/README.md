# Day 11: Terraform Conditionals

This project demonstrates how to use Terraform conditionals and loops to manage infrastructure components dynamically. Specifically, it focuses on managing AWS IAM users, policies, and attachments based on input variables and boolean conditions.

## Key Concepts Covered

- **Conditionals in Terraform**: Utilizing the ternary operator (`condition ? true_val : false_val`) to selectively create resources or apply configurations.
- **Resource Count**: Using the `count` meta-argument with conditionals to toggle resource creation (e.g., conditionally attaching specific IAM policies).
- **Loops with `for_each`**: Iterating over sets or maps to deploy multiple instances of a module or resource, such as creating multiple IAM users from a list of names.
- **Module Refactoring**: Externalizing global resources (like IAM policies) from modules to prevent deployment conflicts (e.g., `409 EntityAlreadyExists` errors) when a module is instantiated multiple times.

## Infrastructure Architecture

- **IAM Users**: Created dynamically based on a provided list of usernames.
- **IAM Policies**: CloudWatch Read-Only and Full-Access policies created at the root level to ensure uniqueness across the AWS account.
- **Policy Attachments**: Conditionally attached to users based on environment variables (e.g., granting developers specific permissions).

## Usage

1. Navigate to the deployment environment directory:
   ```bash
   cd live/global/iam
   ```
2. Initialize Terraform to download the required providers and local modules:
   ```bash
   terraform init
   ```
3. Review the execution plan:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```
