# Day 16 — Building Production-Grade Infrastructure

## Overview

This day captures the work to build production-grade infrastructure using Terraform. The deployment targets two AWS accounts and uses a modular design where a top-level module composes a set of submodules (a "module of modules"). The focus is on reliability, isolation of state, and reusability.

## What I built

- Multi-account infrastructure deployed across two AWS accounts (e.g., `prod` and `shared`/`ops`).
- A top-level module that composes smaller modules (module-of-modules) to assemble networking, compute, and platform services.
- Remote state configuration and locking, and account-specific configuration to isolate environments.

## Architecture

- Account separation for security and blast-radius reduction.
- Module-of-modules pattern for reuse and clear boundaries between concerns (networking, compute, monitoring, IAM).
- Recommended state backend: S3 bucket + DynamoDB for locking (per-account/per-environment backends).

## Modules & Patterns

- `modules/` contains reusable modules (VPC, ASG, service modules, IAM).
- The root module invoked here is a composition module which calls other modules to produce the complete environment.
- Use variables to pass account-specific settings and provider aliases for multi-account deployments.

## Deployment (example)

1. Ensure AWS credentials are set for the target account (or use named profiles).
2. Initialize and select the workspace or backend for the target environment.

```bash
terraform init -backend-config="bucket=<<your-state-bucket>>" \
  -backend-config="key=day16/prod/terraform.tfstate" \
  -backend-config="region=us-east-1"

terraform plan -var-file=prod.tfvars
terraform apply -var-file=prod.tfvars
```

Adjust `key` and `var-file` for the other account/environment when deploying there.

## State and Backends

- Store each account/environment state separately (S3 key per account/env).
- Use DynamoDB table for state locking to avoid concurrent writes.

## Testing and Validation

- Run `terraform plan` and inspect diffs carefully before `apply`.
- Validate cross-account permissions and assume-role configurations when executing from a central pipeline.
- Smoke-test deployed services (health checks, endpoints) and confirm IAM least-privilege.

## Security & Best Practices

- Keep secrets out of Terraform variables; use parameter stores or secrets manager integrations.
- Limit IAM principals and use role assumption between accounts.
- Review network ACLs and security groups for least access.

## Files to review

- Entrypoint and configuration: `main.tf`, `variables.tf`, any `*.tfvars` files in this directory and subfolders.
- Module code: `modules/` under the repository root (see module definitions and outputs).
