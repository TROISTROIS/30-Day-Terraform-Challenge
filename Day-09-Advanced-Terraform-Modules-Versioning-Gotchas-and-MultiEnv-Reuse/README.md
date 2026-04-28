# Day 09: Advanced Terraform Modules, Versioning Gotchas, and Multi-Environment Reuse

Welcome to **Day 9** of the 30-Day Terraform Challenge!

In this challenge, we take Terraform modules to the next level by focusing on how to reliably reuse, version, and manage them across multiple environments (such as Staging and Production). 

## Objectives

- **Multi-Environment Setup**: Learn how to utilize the same underlying module structure for different environments without repeating code.
- **Module Versioning**: Overcome versioning gotchas by pulling modules from specific Git commits, tags, or branches rather than local paths. This ensures immutable infrastructure.
- **Environment-Specific Customizations**: See how variables and scheduled actions can differ drastically between environments despite using the same core module.

## Directory Structure

This day's lab is organized into the following key directories:

- `global/s3/`  
  Contains the backend foundation. It sets up an AWS S3 Bucket for storing Terraform state files remotely and a DynamoDB table for state locking to prevent concurrent modifications.

- `backends/`  
  Contains backend configuration `.hcl` files for different environments (e.g., `prodbackend.hcl`, `stagebackend.hcl`). These allow dynamic backend initialization without hardcoding backend variables in your main terraform configs.

- `stage/services/webserver-cluster/`  
  The Staging environment configuration.
  - **Key takeaway**: Notice how the module `source` parameter points to a remote GitHub repository at a specific tag (`ref=v0.0.1`). This isolates the environment from unreleased or in-progress local module changes.

- `prod/services/webserver-cluster/`  
  The Production environment configuration.
  - **Key takeaway**: Uses a local path referencing the centralized modules directory. 
  - **Bonus**: Includes environment-specific auto-scaling schedules (`aws_autoscaling_schedule`) to automatically scale the web servers in and out during specific times of the day—an advanced feature added specifically for production.

## How to Use

1. **Global Backend Setup**: 
   First, navigate to `global/s3` and run `terraform init` and `terraform apply` to establish your remote state architecture (S3 bucket and DynamoDB table).

2. **Deploy Staging**: 
   Go to `stage/services/webserver-cluster`. Run `terraform init` (Terraform will securely download the versioned module from GitHub). Then run `terraform plan` and `terraform apply` to deploy the staging environment.

3. **Deploy Production**: 
   Go to `prod/services/webserver-cluster`. Run `terraform init`, `terraform plan`, and `terraform apply` to deploy the production infrastructure.

## Important Note on Module Paths

The local `modules` directory for this project has been centralized to a directory outside of this project's parent directory, enabling it to be shared across multiple different infrastructure codebases. If you're exploring the local production configuration, you'll notice the source path goes up several directories (`../../../../../modules/services/webserver`) to cleanly reference the shared `Terraform/modules` folder!
