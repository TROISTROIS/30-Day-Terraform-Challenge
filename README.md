# 30-Day-Terraform-Challenge

This 30-day Terraform challenge was organized by AWS AI/ML UserGroup Kenya, Meru HashiCorp User Group, and EveOps. It is designed to take me from Terraform fundamentals to certification-ready in 30 days, building real infrastructure along the way. Over four weeks, I will work through daily tasks covering Infrastructure as Code concepts.

## Challenge Progression

| Day | Task Detail | Repository Link |
| :--- | :--- | :--- |
| **01** | **SetUp Terraform Environment**: Setting up the local dev environment and deploying a basic AWS VPC. | [Day 01](./Day-01-SetUp-Terraform-Environment/) |
| **02** | **Setting Up Terraform Environment**: Verifying Terraform/AWS CLI installation and configuring credentials. | [Day 02](./Day-02-Setting-Up-Terraform/) |
| **03** | **Deploying First Server**: Deploying a basic web server on AWS using a `t2.micro` instance. | [Day 03](./Day-03-Deploying-Your-First-Server-With-Terraform/) |
| **04** | **High Availability WebApp**: Scaling infrastructure using Application Load Balancer and Auto Scaling Group. | [Day 04](./Day-04-Deploying-a-HA-WebApp-On-AWS/) |
| **05** | **Understanding State**: Exploring state management, manual tampering, and observing state drift. | [Day 05](./Day-05-Scaling-Infrastructure-and-Understanding-Terraform-State/) |
| **06** | **Remote State Management**: Using S3 bucket for state storage and DynamoDB for state locking. | [Day 06](./Day-06-Understanding-and-Managing-Terraform-State-with-S3-and-DynamoDB/) |
| **07** | **State Isolation: Workspaces vs-File Layouts**: Using Terraform workspaces and file layouts for state isolation. | [Day 07](./Day-07-Terraform%20State%20Isolation-Workspaces-vs-File%20Layouts/) |
| **08** | **Building Reusable Infrastructure with Terraform Modules**: Abstracting infrastructure into reusable and maintainable modules. | [Day 08](./Day-08-Building-Reusable-Infrasructure-with-Terraform-Modules/) |
| **09** | **Advanced Terraform Modules**: Advanced Terraform modules, versioning gotchas, and multi-environment reuse. | [Day 09](./Day-09-Advanced-Terraform-Modules-Versioning-Gotchas-and-MultiEnv-Reuse/) |

## Prerequisites
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
- An AWS Account with appropriate IAM permissions.

## Repository Structure
- `Day-01-SetUp-Terraform-Environment/`: Infrastructure for Day 1.
- `Day-02-Setting-Up-Terraform/`: Environment setup for Day 2.
- `Day-03-Deploying-Your-First-Server-With-Terraform/`: First server deployment for Day 3.
- `Day-04-Deploying-a-HA-WebApp-On-AWS/`: High Availability infrastructure for Day 4.
- `Day-05-Scaling-Infrastructure-and-Understanding-Terraform-State/`: Scaling and state management experiments for Day 5.
- `Day-06-Understanding-and-Managing-Terraform-State-with-S3-and-DynamoDB/`: Remote state management using S3 and DynamoDB for Day 6.
- `Day-07-Terraform State Isolation-Workspaces-vs-File Layouts/`: Using Terraform workspaces and file layouts for state isolation for Day 7.
- `Day-08-Building-Reusable-Infrasructure-with-Terraform-Modules/`: Building reusable infrastructure with Terraform modules for Day 8.
- `Day-09-Advanced-Terraform-Modules-Versioning-Gotchas-and-MultiEnv-Reuse/`: Advanced Terraform modules, versioning gotchas, and multi-environment reuse for Day 9.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
