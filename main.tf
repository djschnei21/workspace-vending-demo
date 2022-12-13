terraform {
}

module "workspace-vending" {
  source  = "app.terraform.io/djs-tfcb/workspace-vending/tfe"
  version = "4.0.0"

  tf_org = "djs-tfcb"
  gh_org = "djschnei21"
  oauth_client_name = "github-test"

  app_ids = [
    "100"
  ]
  app_envs = [ "development", "uat", "production" ]
}

variable "dev_vsphere_server" {
  type = string
  default = ""
}

variable "dev_vsphere_password" {
  type = string
  default = ""
  sensitive = true
}

variable "dev_vsphere_user" {
  type = string
  default = ""
}

data "tfe_workspace_ids" "dev" {
  tag_names    = ["development"]
  organization = "djs-tfcb"
}

resource "tfe_variable_set" "dev_vsphere" {
  name          = "Dev vSphere Credentials"
  description   = "Required variables for a workspace to connect to dev vSphere"
  organization  = "djs-tfcb"
}

resource "tfe_variable" "dev_vsphere_server" {
  key             = "vsphere_server"
  value           = var.dev_vsphere_server
  category        = "terraform"
  variable_set_id = tfe_variable_set.dev_vsphere.id
}

resource "tfe_variable" "dev_vsphere_password" {
  key             = "vsphere_password"
  value           = var.dev_vsphere_password
  category        = "terraform"
  sensitive       = true
  variable_set_id = tfe_variable_set.dev_vsphere.id
}

resource "tfe_variable" "dev_vsphere_user" {
  key             = "vsphere_user"
  value           = var.dev_vsphere_user
  category        = "terraform"
  variable_set_id = tfe_variable_set.dev_vsphere.id
}

resource "tfe_workspace_variable_set" "dev_vsphere" {
  for_each = data.tfe_workspace_ids.dev
  variable_set_id = tfe_variable_set.dev_vsphere.id
  workspace_id    = each.key
}

