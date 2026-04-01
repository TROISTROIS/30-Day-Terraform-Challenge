# Day 07: Terraform State Isolation: Workspaces vs. File Layouts

## Objective
The objective of today's challenge was to understand and implement state isolation in Terraform using two main strategies: **Terraform Workspaces** and **File Layouts**. Proper state isolation is crucial for managing different environments (e.g., development, staging, production) safely without risk of accidental resource overlap or destruction.

## Terraform Workspaces
Terraform Workspaces allow you to manage multiple sets of infrastructure state in a single configuration directory. Each workspace has its own separate state file.

### Commands Used in This Session:
- **`terraform workspace show`**: Displays the current active workspace. By default, this is `default`.
- **`terraform workspace new <workspace_name>`**: Creates a new workspace with the specified name and automatically switches to it.
- **`terraform workspace select <workspace_name>`**: Switches back to an existing workspace.
- **`terraform workspace list`**: Lists all available workspaces in the current configuration.

### How it Works
When using workspaces, Terraform stores state files in a directory named `terraform.tfstate`. For example, if you create a workspace named `stage`, the state file will be stored under `terraform.tfstate/stage/terraform.tfstate`.

## File-Based Isolation (File Layouts)
Unlike workspaces, file-based isolation uses separate directories for each environment. This is often considered a more robust approach for production environments as it provides strict separation between different configurations and state files, which can be stored in different backend locations (e.g., different S3 buckets).
### Example File Layout Structure:
```text
environments/
├── dev/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── backend.tf
├── staging/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── backend.tf
└── production/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── backend.tf
```

## Workflow Comparison
- **Workspaces**: Quick to set up, good for temporary testing or when the configuration is identical across environments.
- **File Layouts**: More granular control, easier to implement environment-specific changes, and provides better security and isolation.

---
*Stay tuned for Day 08 as we continue this Terraform journey!* 


