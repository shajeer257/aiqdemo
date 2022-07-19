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



/* # Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "${get_env("TG_BUCKET_PREFIX", "")}terragrunt-example-terraform-state-${local.account_name}-${local.aws_region}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    dynamodb_table = "terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
} */