
data "azuread_client_config" "current" {}

resource "azuread_application" "this" {
  display_name = "sp-${var.display_name}"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "this" {
  application_id               = azuread_application.this.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_password" "this" {
  application_object_id = azuread_application.this.object_id
  display_name          = var.azure_devops_project.name
}

resource "azuredevops_serviceendpoint_azurerm" "this" {
  project_id                = var.azure_devops_project.id
  service_endpoint_name     = "sc-azurerm-${var.display_name}"
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name
  credentials {
    serviceprincipalid  = azuread_application.this.application_id
    serviceprincipalkey = azuread_application_password.this.value
  }
}
