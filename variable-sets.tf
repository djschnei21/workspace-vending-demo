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
  for_each = data.tfe_workspace_ids.dev.ids
  variable_set_id = tfe_variable_set.dev_vsphere.id
  workspace_id    = each.value
}

variable "uat_vsphere_server" {
  type = string
  default = ""
}

variable "uat_vsphere_password" {
  type = string
  default = ""
  sensitive = true
}

variable "uat_vsphere_user" {
  type = string
  default = ""
}

data "tfe_workspace_ids" "uat" {
  tag_names    = ["uat"]
  organization = "djs-tfcb"
}

resource "tfe_variable_set" "uat_vsphere" {
  name          = "UAT vSphere Credentials"
  description   = "Required variables for a workspace to connect to UAT vSphere"
  organization  = "djs-tfcb"
}

resource "tfe_variable" "uat_vsphere_server" {
  key             = "vsphere_server"
  value           = var.uat_vsphere_server
  category        = "terraform"
  variable_set_id = tfe_variable_set.uat_vsphere.id
}

resource "tfe_variable" "uat_vsphere_password" {
  key             = "vsphere_password"
  value           = var.uat_vsphere_password
  category        = "terraform"
  sensitive       = true
  variable_set_id = tfe_variable_set.uat_vsphere.id
}

resource "tfe_variable" "uat_vsphere_user" {
  key             = "vsphere_user"
  value           = var.uat_vsphere_user
  category        = "terraform"
  variable_set_id = tfe_variable_set.uat_vsphere.id
}

resource "tfe_workspace_variable_set" "uat_vsphere" {
  for_each = data.tfe_workspace_ids.uat.ids
  variable_set_id = tfe_variable_set.uat_vsphere.id
  workspace_id    = each.value
}

variable "prod_vsphere_server" {
  type = string
  default = ""
}

variable "prod_vsphere_password" {
  type = string
  default = ""
  sensitive = true
}

variable "prod_vsphere_user" {
  type = string
  default = ""
}

data "tfe_workspace_ids" "prod" {
  tag_names    = ["production"]
  organization = "djs-tfcb"
}

resource "tfe_variable_set" "prod_vsphere" {
  name          = "Production vSphere Credentials"
  description   = "Required variables for a workspace to connect to Production vSphere"
  organization  = "djs-tfcb"
}

resource "tfe_variable" "prod_vsphere_server" {
  key             = "vsphere_server"
  value           = var.prod_vsphere_server
  category        = "terraform"
  variable_set_id = tfe_variable_set.prod_vsphere.id
}

resource "tfe_variable" "prod_vsphere_password" {
  key             = "vsphere_password"
  value           = var.prod_vsphere_password
  category        = "terraform"
  sensitive       = true
  variable_set_id = tfe_variable_set.prod_vsphere.id
}

resource "tfe_variable" "prod_vsphere_user" {
  key             = "vsphere_user"
  value           = var.prod_vsphere_user
  category        = "terraform"
  variable_set_id = tfe_variable_set.prod_vsphere.id
}

resource "tfe_workspace_variable_set" "prod_vsphere" {
  for_each = data.tfe_workspace_ids.prod.ids
  variable_set_id = tfe_variable_set.prod_vsphere.id
  workspace_id    = each.value
}