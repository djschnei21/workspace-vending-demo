terraform {
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
    "jenkins",
    "aws-sandbox-iam-bootstrap"
  ]

  app_envs = [ "development" ]
}
