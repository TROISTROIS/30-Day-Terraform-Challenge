# Day 12: Zero-Downtime Deployments with Terraform

This project demonstrates strategies for performing zero-downtime deployments using Terraform. Zero-downtime deployments ensure that infrastructure updates do not interrupt service availability, which is critical for production environments. The focus is on deploying changes to a web server cluster while maintaining continuous availability.

## Key Concepts Covered

- **Zero-Downtime Deployment Strategies**: Techniques to update infrastructure without service interruption, including blue-green deployments and rolling updates.
- **Terraform State Management**: Using different backends for staging and production environments to isolate state and enable safe deployments.
- **Module Versioning**: Leveraging module versioning to control infrastructure changes and rollbacks.
- **Environment Isolation**: Separating staging and production deployments to test changes before applying them to production.

## Infrastructure Architecture

- **Global Resources**: S3 bucket and DynamoDB table for remote state storage and locking.
- **Staging Environment**: Web server cluster deployed in a staging environment with remote state backend for testing updates.
- **Production Environment**: Web server cluster deployed in production with local state for demonstration purposes.
- **Web Server Cluster**: Auto-scaling group of EC2 instances running a simple web server, configured through reusable modules.

## Deployment Strategy

The zero-downtime deployment is achieved by:

1. **Testing in Staging**: Deploy and test changes in the staging environment first.
2. **Gradual Rollout**: Update production infrastructure incrementally to avoid downtime.
3. **State Isolation**: Use separate state files for different environments to prevent conflicts.
4. **Rollback Capability**: Maintain previous module versions for quick rollbacks if needed.

## Usage

### Deploy Global Resources

1. Navigate to the global S3 directory:
   ```bash
   cd live/global/s3
   ```
2. Initialize and apply the backend configuration:
   ```bash
   terraform init
   terraform apply
   ```

### Deploy Staging Environment

1. Navigate to the staging services directory:
   ```bash
   cd live/stage/services/webserver-cluster
   ```
2. Initialize with the remote backend:
   ```bash
   terraform init -backend-config=../../../../backends/statebackend.hcl
   ```
3. Apply the staging configuration:
   ```bash
   terraform apply
   ```

### Deploy Production Environment

1. Navigate to the production services directory:
   ```bash
   cd live/prod/services/webserver-cluster
   ```
2. Initialize and apply (using local state):
   ```bash
   terraform init
   terraform apply
   ```

### Performing Zero-Downtime Updates

To demonstrate a zero-downtime deployment:

1. Update the `server_text` variable in the production configuration to simulate a new deployment.
2. Run `terraform plan` to review changes.
3. Apply the changes with `terraform apply` - the auto-scaling group will perform rolling updates without downtime.

## Prerequisites

- Terraform CLI installed
- AWS CLI configured with appropriate credentials