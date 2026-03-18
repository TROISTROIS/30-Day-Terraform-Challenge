# Day 03 - Deploying Your First Server With Terraform

## Project Overview

In this challenge, we deploy a basic web server on AWS using Terraform. The infrastructure consists of an EC2 instance running a simple web server and a security group to allow external access.

## Features

- **AWS Provider**: Configured for the `us-east-1` region.
- **EC2 Instance**: Uses a `t2.micro` instance with a custom Amazon Machine Image (AMI).
- **User Data**: Automatically starts a simple web server using `busybox httpd` upon instance launch.
- **Security Group**: Opens a specific port (default `8080`) to allow incoming traffic.
- **Outputs**: Displays the public IP address of the server after deployment.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials.
- An AWS profile named `IAMAdmin-GEN` (or modify `main.tf` to use your default profile).

## Infrastructure Components

| Resource | Description |
| --- | --- |
| `aws_instance` | The EC2 instance acting as our web server. |
| `aws_security_group` | Controls inbound/outbound traffic for the instance. |
| `port_number` | A Terraform variable defining the web server's listening port. |

## How to Deploy

1.  **Initialize Terraform**:
    ```bash
    terraform init
    ```

2.  **Preview Changes**:
    ```bash
    terraform plan
    ```

3.  **Apply Configuration**:
    ```bash
    terraform apply
    ```
    Confirm the action by typing `yes` when prompted.

## Verification

Once the deployment is complete, Terraform will output the `public_ip`. You can verify the web server by visiting:

```text
http://<public_ip>:8080
```

You should see the message: *"Yaay! Welcome to my web server. I just Completed Day 03 of the Terraform Challenge."*

## Cleanup

To avoid ongoing AWS costs, destroy the infrastructure when finished:

```bash
terraform destroy
```
