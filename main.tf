terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_iam_roles" "list" {
}

module "workspace-vending" {
  # source  = "app.terraform.io/djs-tfcb/workspace-vending/tfe"
  # version = "4.0.0"
  source = "github.com/djschnei21/terraform-tfe-workspace-vending"

  tf_org = "djs-tfcb"
  gh_org = "djschnei21"
  oauth_client_name = "github-test"
  vcs = true
  projects = true

  app_ids = [
    "tfc-cloud-agents",
    "jenkins"
  ]

  app_envs = [ "development" ]
}

output "iam_roles" {
  value = data.aws_iam_roles.list
}

output "workspaces" {
  value = module.workspace-vending.workspaces
}
