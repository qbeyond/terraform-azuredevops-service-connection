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

provider "azuread" {}

provider "azuredevops" {
  org_service_url = "<yourDevopsUrl>"
  personal_access_token = "<yourPAT>"
}

data "azuread_devops_project" "example" {
  name = "Example Project"
}

data "azurerm_subscription" "current" {}

module "service_connection" {
  source = "../.."
  azure_devops_project = data.azure_devops_project.example
  display_name = data.azurerm_subscription.current.display_name
  subscription_id = data.azurerm_subscription.current.id
  subscription_name = data.azurerm_subscription.current.name
  tenant_id = data.azurerm_subscription.current.tenant_id
}