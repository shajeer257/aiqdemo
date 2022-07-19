terraform {
  source = "../../../terraform"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "kubernetes" {
   config_path = "~/.kube/config"
}
EOF
}

locals {
    workspace = read_terragrunt_config(find_in_parent_folders("workspace.hcl"))
}

generate "backend" {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<-EOF
    terraform {
        backend "remote" {
            organization = "shajeer"
            workspaces {
                prefix = "${local.workspace.locals.workspace_prefix}"
            }
        }
    }
    EOF
}