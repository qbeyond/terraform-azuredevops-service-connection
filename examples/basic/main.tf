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
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.63.0"
    }
  }
}

provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
  org_service_url = "<yourDevopsUrl>"
  personal_access_token = "<yourPAT>"
}

data "azuredevops_project" "example" {
  name = "Example Project"
}

data "azurerm_subscription" "current" {}

module "service_connection" {
  source = "../.."
  azure_devops_project = data.azuredevops_project.example
  display_name = data.azurerm_subscription.current.display_name
  subscription_id = data.azurerm_subscription.current.subscription_id
  subscription_name = data.azurerm_subscription.current.display_name
  tenant_id = data.azurerm_subscription.current.tenant_id
}