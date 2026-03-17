# Day 02: Setting Up Terraform Environment

This challenge focuses on verifying the local environment setup for Terraform and AWS CLI, ensuring the correct versions are installed and that the AWS identity is properly configured.

## Environment Verification Commands

To verify your environment, run the following commands in your terminal:

### 1. Check Terraform Version
Verify that Terraform is installed and check its current version.
```bash
terraform version
```

### 2. Check AWS CLI Version
Verify that the AWS Command Line Interface is installed.
```bash
aws --version
```

### 3. Verify AWS Identity
Confirm the currently authenticated AWS user or role.
```bash
aws sts get-caller-identity
```

### 4. Inspect AWS Profile Configuration
List the configuration settings for the specific admin profile used in this project.
```bash
aws configure list --profile IAMAdmin-Prod
```

---
*This is part of the 30-Day Terraform Challenge.*
