terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.36.0"
    }
  }
}

data "azuredevops_project" "this" {
  name = "<ProjectName>"
}

module "service_connection_eslz" {
  source               = "qbeyond/service-connection/azuredevops"
  version              = "v1.0.0"
  subscription_id      = "<subscriptionID>"
  subscription_name    = "<subscriptionName>"
  display_name         = "DisplayName"
  azure_devops_project = data.azuredevops_project.this
  tenant_id            = "<TenantID>"
}