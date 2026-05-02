# Day 10: Terraform Loops and Conditionals

This directory contains the code for Day 10 of the 30-Day Terraform Challenge. The focus of this day is on efficiently managing multiple resources using Terraform's iteration and conditional logic features.

## Concepts Covered

- **Loops**: Using `count` and `for_each` meta-arguments to dynamically provision multiple similar resources without duplicating code.
- **Data Transformation**: Utilizing `toset` and list transformations to format variables appropriately for `for_each` iteration.
- **Modules and Iteration**: Applying loops directly to module calls to deploy multiple instances of a module.
- **Outputs with Loops**: Extracting and formatting attributes from collections of resources using the splat operator (`[*]`) and the `values()` function.

## Infrastructure Highlights

The code demonstrates creating multiple IAM users from a centralized module by passing a list of usernames (`dev`, `stage`, `prod`). 

Key files included in this environment:
- `live/global/iam/main.tf`: Uses the `for_each` meta-argument on a module to create IAM users based on a provided list of names.
- `live/global/iam/variables.tf`: Defines the `user_names` list variable containing the target environments or user identities.
- `live/global/iam/outputs.tf`: Demonstrates how to output a single specific attribute from an iterated resource, as well as an array containing the ARNs of all generated IAM users.

## Usage

Navigate to the IAM directory to initialize and apply the configuration:

```bash
cd live/global/iam
terraform init
terraform plan
terraform apply
```

After deploying, verify the created resources and observe the structured outputs that return the exact ARNs of the dynamically generated IAM users. Remember to run `terraform destroy` when finished to prevent unwanted resource accumulation.
