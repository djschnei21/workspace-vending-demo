terraform {
}

module "workspace-vending" {
  # source  = "app.terraform.io/djs-tfcb/workspace-vending/tfe"
  # version = "4.0.0"
  source = "github.com/djschnei21/terraform-tfe-workspace-vending"

  tf_org = "djs-tfcb"
  gh_org = "djschnei21"
  oauth_client_name = "github-test"

  app_ids = [
  ]
  app_envs = [ "development", "uat", "production" ]
}
