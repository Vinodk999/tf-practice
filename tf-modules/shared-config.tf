locals {
    project_name = "module-1"
    common_tags = {
        Project = local.project_name
        ManagedBy = "Terraform"
    }
}