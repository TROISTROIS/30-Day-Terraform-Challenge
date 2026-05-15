# Day 14 - Working with Multiple Providers

This day demonstrates how to deploy Terraform infrastructure using multiple AWS provider configurations, provider aliases, and reusable modules. The focus is on multi-region infrastructure and module reuse for both staging and production deployments.

## What this day covers

- Configuring multiple AWS providers with aliases to target different AWS regions.
- Passing provider configurations into reusable modules using the `providers` map.
- Deploying a primary database and a read replica across separate provider configurations.
- Using AWS Secrets Manager to retrieve credentials for RDS deployment.
- Managing remote state through an S3 backend.

## Repository layout

- `backend/`
  - Holds backend configuration and the module used to provision remote state resources.
- `multi-region/provider.tf`
  - Declares aliased AWS providers for multi-region use.
- `live/global/s3/`
  - Example global backend provisioning using the centralized backend module.
- `live/stage/datastores/mysql/`
  - Stage environment deployment of the RDS datasource module with a primary provider.
- `live/prod/datastores/postgres/`
  - Production environment deployment with primary and replica RDS instances using provider aliasing.

## Key concepts

### Multiple provider configurations
This day uses more than one AWS provider block, each with a different `alias` and region. The local root module passes an aliased provider into the reusable RDS datasource module.

### Provider injection
The module call includes a `providers` block such as:

```hcl
providers = {
  aws = aws.primary
}
```

This allows the reusable module to use the selected provider configuration from the parent module.

### Module reuse
The same datasource module is used for multiple environments and roles:

- Stage primary database
- Production primary database
- Production replica database

The module source is pinned to a Git ref so the deployment is stable and version controlled.

### Remote state and secure credentials
The environment uses an S3 backend for remote state, and Secrets Manager is used to provide database credentials without hardcoding them into Terraform.

## Notes

- Ensure that the AWS credentials and secret names referenced in the staging and production configurations are available in the target account.
- Confirm that the backend settings in `backend/backend.hcl` and the `backend.tf` files match the intended state location.
- The module source is version pinned to a tag in the shared module repository.
