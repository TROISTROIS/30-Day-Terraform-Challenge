# Day 13: Managing Sensitive Data Securely in Terraform

This day covers how to keep secrets out of Terraform configuration and state by using AWS Secrets Manager together with reusable Terraform modules.

## What this day demonstrates

- Retrieving database credentials from `aws_secretsmanager_secret_version`
- Decoding the secret payload with `jsondecode()` into secure local values
- Passing sensitive credentials into a reusable module without hardcoding them in Terraform files
- Using a remote module source for MySQL datasource deployment
- Showing a backend configuration pattern for remote state storage and locking

## Directory structure

- `backend/backend.hcl` - Backend configuration for S3 remote state, locking, and encryption
- `live/stage/services/datasources/mysql/` - Stage environment configuration for the MySQL datasource

## Key files

- `live/stage/services/datasources/mysql/main.tf`
  - Uses a reusable module for MySQL deployment, passing secure credentials from Secrets Manager
- `live/stage/services/datasources/mysql/data.tf`
  - Loads the Secrets Manager secret version
- `live/stage/services/datasources/mysql/local.tf`
  - Decodes the JSON secret payload into local values for `username` and `password`
- `live/stage/services/datasources/mysql/output.tf`
  - Exposes the RDS endpoint output from the module

## How to use it

1. Ensure you have an AWS Secrets Manager secret with the secret ID `RDScreds`.
2. Store credentials in JSON format, for example:

```json
{
  "username": "admin",
  "password": "SuperSecurePassword123!"
}
```

3. Run Terraform from the MySQL module folder:

```bash
terraform init -backend-config=../../../../backend/backend.hcl
terraform apply
```

4. Confirm the `rds_endpoint` output after deployment.

## Security best practices shown here

- Do not store database passwords or other secrets in plaintext Terraform files.
- Retrieve secrets at runtime from AWS Secrets Manager.
- Keep sensitive data in external secure stores rather than embedding it directly in source control.
- Use module inputs to pass secrets safely into reusable infrastructure components.
- Configure remote state with encryption and locking to protect state data.

## Notes

The backend file in this day is intended as a reference configuration for remote state. In practice, you may configure the actual Terraform backend either via the CLI or an environment-specific file.
