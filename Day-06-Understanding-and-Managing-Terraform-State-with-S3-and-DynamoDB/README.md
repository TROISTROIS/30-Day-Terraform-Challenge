# Day 06: Understanding and Managing Terraform State with S3 and DynamoDB

Welcome to **Day 06** of the 30-Day Terraform Challenge! Today's session was a deep dive into one of Terraform's most critical concepts: **State Management**. We explored how to move away from local state files to a robust, secure, and collaborative remote state backend using AWS S3 and DynamoDB.

---

## Project Overview

In this challenge, I transitioned from managing state locally (which is risky for teams and production) to a production-grade remote backend. This setup ensures that:
- **Durability:** State is stored in S3 with versioning enabled.
- **Security:** State is encrypted at rest (SSE-AES256).
- **Concurrency Control:** State is locked to prevent race conditions during concurrent runs.

---

## Architecture & Components

The project is split into two main sections:

### 1. Backend Setup (`/Backend`)
This houses the infrastructure required to support Terraform's remote state itself.
- **S3 Bucket:** `day-6-bucket-zn` (Enabled with versioning and encryption).
- **DynamoDB Table:** `day-6-locks` (Provisioned for state locking).
- **Public Access Block:** Ensuring the S3 bucket remains private and secure.

### 2. Main Infrastructure (`/Infrastructure`)
The actual workload being deployed:
- **AWS Lambda:** `Day-6-lambda-function` written in Python 3.11.
- **IAM Role:** Secure execution role for the Lambda function.
- **Remote Backend Config:** Configured within `resources.tf` to point to the S3 bucket created in the backend step.

---

## Deep Investigation: Managing State

A major part of today's challenge was a "Deep Investigation" into inspection and manipulation of the Terraform state. These commands are essential for troubleshooting and auditing.

| Command | Purpose |
| :--- | :--- |
| `terraform show` | Provides a human-readable output of the current state. |
| `terraform state list` | Lists all resources currently tracked in the state file. |
| `terraform state show aws_lambda_function.lambda-Function` | Displays detailed attributes of the specific Lambda resource in the state. |

---

## Step-by-Step implementation

Follow these steps to replicate the setup:

### Step 1: Initialize the Remote Backend
1. Navigate to the `Backend` directory.
2. Run `terraform init`.
3. Run `terraform apply` to create the S3 bucket and DynamoDB table.
4. *Note: The bucket name must be unique globally.*

### Step 2: Configure the Infrastructure
1. Navigate to the `Infrastructure` directory.
2. Ensure the `backend "s3"` block in `resources.tf` matches your created bucket details.
3. Run `terraform init`. 
    - Terraform will detect the change and ask if you want to migrate existing state to S3. Type **yes**.

### Step 3: Deployment lifecycle
1. **Initialize:** `terraform init` (if not done in step 2).
2. **Review:** `terraform plan` to see what is about to be created.
3. **Deploy:** `terraform apply` to deploy the Lambda function and IAM role.
4. **Inspect:** 
    - `terraform show`
    - `terraform state list`
    - `terraform state show aws_lambda_function.lambda-Function`

### Step 4: Resource Cleanup
To avoid unnecessary costs, clean up the resources in the following order:
1. In `Infrastructure/`, run `terraform destroy`.
2. In `Backend/`, run `terraform destroy`. 
    *   *Note: In `Backend/main.tf`, I've set `prevent_destroy = true` for the S3 bucket as a safety measure. You'll need to update this to `false` and empty the bucket if you intend to destroy the backend itself.*

---

## Key Takeaways
- **The State is the Source of Truth:** Terraform relies on it to know what exists in the real world.
- **Never Commit `terraform.tfstate`:** Always use a remote backend for safety and collaboration.
- **Locking is Critical:** Prevents two users from applying changes at the same time and corrupting the state file.

---
*Stay tuned for Day 07 as we continue this Terraform journey!* 
