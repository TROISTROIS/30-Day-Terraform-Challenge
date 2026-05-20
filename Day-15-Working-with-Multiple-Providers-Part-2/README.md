# Day 15 - Working with Multiple Providers Part 2

This day extends the multi-provider work from Day 14 into a multi-account deployment pattern. It demonstrates how to use aliased provider configurations, cross-account role assumption, and shared modules to deploy infrastructure across stage and global environments.

## What this day covers

- Defining multiple AWS provider configurations with aliases for different environments and accounts.
- Assuming a cross-account IAM role for production deployment.
- Using shared modules for multi-account infrastructure deployments.
- Configuring remote state storage with an S3 backend for both global and stage environments.

## Repository layout

- `backend/`
  - Contains backend configuration for Terraform state and the shared backend definition.
- `live/global/s3/`
  - Global state provisioning using an S3 backend.
- `live/stage/multi-account/`
  - Stage environment deployment that uses aliased `stage` and `prod` AWS providers.
- `multi-account/`
  - Shared module for deploying resources in a multi-account provider-aware setup.

## Key concepts

### Multi-account provider configuration
This day uses multiple `aws` provider blocks with aliases, including a `stage` provider and a `prod` provider that assumes an IAM role in another account.

### Provider injection into modules
The main stage deployment explicitly forwards aliased providers into the shared module using a `providers` block:

```hcl
module "multi-account" {
  source = "../../../../../modules/multi-account"
  providers = {
    aws.stage = aws.stage
    aws.prod  = aws.prod
  }
}
```

### Remote state for environment isolation
The stage and global environments are configured with separate S3 backend state locations to isolate Terraform state across deployment boundaries.

## Notes

- Ensure the `role_arn` used by the production provider is valid and the calling identity has permission to assume that role.
- Confirm the S3 backend settings in `live/global/s3/backend.tf` and `live/stage/multi-account/backend.tf` match the desired remote state paths.
- The `multi-account` module is designed to be provider-aware and reusable across both stage and production contexts.
