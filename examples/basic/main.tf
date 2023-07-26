terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.39.0"
    }
  }
}

provider "azuread" {
  tenant_id = ""
}

data "azuread_devops_project" "example" {
  name = "Example Project"
}

module "service_connection" {
  source = "../.."
  azure_devops_project = data.azure_devops_project.example
  display_name = "example"
  subscription_id = ""
  subscription_name = "example-subscription"
  tenant_id = ""
}