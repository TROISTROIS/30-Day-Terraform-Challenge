# Day 04 - Deploying a High Availability Web Application on AWS

## Overview
On Day 04 of the 30-Day Terraform Challenge, the focus is on deploying a scalable and highly available web application infrastructure on AWS. This setup utilizes an Application Load Balancer (ALB) to distribute traffic across multiple EC2 instances managed by an Auto Scaling Group (ASG) within a custom VPC.

## Infrastructure Components
The Terraform configuration in this directory creates the following resources:

- **Networking**:
  - A custom VPC.
  - Four subnets distributed across two Availability Zones (AZs) for high availability.
  - An Internet Gateway to provide internet access to the public subnets.
  - Route Tables and associations for traffic routing.

- **Load Balancing**:
  - An Application Load Balancer (ALB) to handle incoming HTTP requests.
  - A Target Group for the EC2 instances.
  - ALB Listeners and rules to forward traffic to the target group.

- **Compute and Scaling**:
  - A Launch Template defining the EC2 instance configuration (AMI, instance type, security groups, and user data).
  - An Auto Scaling Group (ASG) to maintain the desired number of instances and handle scaling.
  - EC2 instances are automatically provisioned with a simple web server via user data.

- **Security**:
  - Security Groups for the ELB to allow HTTP traffic.
  - Security Groups for the EC2 instances, restricted to allow traffic only from the ELB.

## Files
- `datasource.tf`: Defines data sources for dynamic information like available AZs.
- `outputs.tf`: Exports important values such as the ALB DNS name.
- `provider.tf`: Configures the AWS provider.
- `resources.tf`: Contains the main resource definitions for the infrastructure.
- `variables.tf`: Defines input variables for customization.

## How to Use
1. Initialize the Terraform directory:
   ```bash
   terraform init
   ```

2. Preview the execution plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration to create the infrastructure:
   ```bash
   terraform apply
   ```

## Verification
Once the infrastructure is deployed, you can verify the setup by following these steps:

1. View the Terraform outputs to get the Load Balancer DNS name:
   ```bash
   terraform outputs
   ```

2. Use `curl` to send a request to the Load Balancer DNS:
   ```bash
   curl LoadBalancerDNS
   ```

3. Expected Output:
   If the deployment is successful, you should see the following message:
   ```text
   Yaay! Welcome to my web server. I just Completed Day 04 of the Terraform Challenge.
   ```

4. Alternatively, copy the Load Balancer DNS name and paste it into your web browser to view the page.

## Cleanup
To remove the resources and avoid any further costs:
   ```bash
   terraform destroy
   ```
