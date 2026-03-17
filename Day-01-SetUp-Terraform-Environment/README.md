# Day 1: Set Up Terraform Environment & Basic AWS VPC

## Overview
Day 1 of the 30-Day Terraform Challenge focuses on setting up the local development environment and deploying a foundational AWS VPC infrastructure. The goal is to establish a secure and scalable network architecture that can be used for subsequent days.

## Infrastructure Components
The following AWS resources were provisioned in this day's task:
- **VPC (Virtual Private Cloud)**: A custom VPC with a specified CIDR block.
- **Public Subnets**: Three public subnets across different availability zones, with `map_public_ip_on_launch` enabled for external accessibility.
- **Private Subnets**: Three private subnets for resources that do not require direct internet access.
- **Internet Gateway (IGW)**: Enables internet access for resources in the public subnets.
- **NAT Gateway**: Allows resources in the private subnets to access the internet while remaining protected from inbound traffic.
- **Route Tables**: Separate public and private route tables with appropriate associations for public and private subnets.
- **Elastic IP (EIP)**: A static IP for the NAT Gateway.

## Folder Structure
- `main.tf`: Contains the primary Terraform configuration for deploying the VPC and its subcomponents.
- `variables.tf`: Defines the configurable parameters such as regional settings, CIDR blocks, and subnet names.
- `test.tf`: A simple test configuration to verify AWS connectivity and retrieve the current account ID.

## How to Run

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Validate Configuration**:
   ```bash
   terraform validate
   ```

3. **Check the Plan**:
   ```bash
   terraform plan
   ```

4. **Deploy**:
   ```bash
   terraform apply
   ```

## Lessons Learned
- Initializing a Terraform project and configuring the AWS provider.
- Implementing the `for_each` meta-argument for resource modularity.
- Using `cidrsubnet` to dynamically calculate subnet ranges.
- Understanding the difference between public and private networking in AWS.
