# Day 08: Building Reusable Infrastructure with Terraform Modules

## Overview
This directory contains the code for Day 08 of the 30-Day Terraform Challenge. The goal of this challenge is to understand and implement Terraform Modules to create reusable, maintainable, and scalable infrastructure code. By using modules, we can abstract complex infrastructure components and reuse them across different environments (such as staging and production) without duplicating code.

## Architecture
This project is structured to separate the reusable module definitions from the live environment configurations:

*   **Modules**: The `Modules` directory contains the core, reusable Terraform code. In this project, we created a `webserver-cluster` module under `Modules/Services/webserver-cluster`. This module encapsulates the creation of an EC2 instance, its associated Security Group, and a user data script to run a simple web server.
*   **Live Environments**: The `stage` and `global` directories represent live environments that consume the modules. The `stage/services/webserver-cluster` directory uses the reusable web server module to deploy a specific instance for the staging environment. 

## Key Concepts Covered
*   **Terraform Modules**: Creating a local module by defining input variables (`variables.tf`), outputs (`outputs.tf`), and core resources (`main.tf`).
*   **Module Instantiation**: Calling a module from a live environment using the `module` block and the `source` argument.
*   **Variable Passing**: Passing environment-specific variables (like `instance_type` and `cluster_name`) to customize the module for different use cases.
*   **Remote State Data Sources**: Using the `terraform_remote_state` data source to dynamically fetch outputs (like database endpoint and port) from another Terraform configuration's state file and pass them into the module.

## Directory Structure
```text
Day-08-Building-Reusable-Infrasructure-with-Terraform-Modules/
|-- Modules/
|   |-- DataStores/
|   `-- Services/
|       `-- webserver-cluster/
|           |-- local.tf
|           |-- main.tf
|           |-- outputs.tf
|           |-- user-data.sh
|           `-- variables.tf
|-- global/
|   `-- s3/
`-- stage/
    |-- data-stores/
    `-- services/
        `-- webserver-cluster/
            |-- backend.tf
            |-- main.tf
            `-- outputs.tf
```

## How to Deploy
1.  Navigate to the live environment directory:
    ```bash
    cd stage/services/webserver-cluster
    ```
2.  Initialize the Terraform workspace:
    ```bash
    terraform init
    ```
3.  Review the execution plan:
    ```bash
    terraform plan
    ```
4.  Apply the configuration to provision the infrastructure:
    ```bash
    terraform apply
    ```
5.  Once the deployment is complete, Terraform will output the public IP address of the web server. Access the web server by navigating to `http://<public_ip>:8080` in your web browser.

## Clean Up
To destroy the resources and avoid incurring charges, run the following command from the `stage/services/webserver-cluster` directory:
```bash
terraform destroy
```
