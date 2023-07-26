
data "azuread_client_config" "current" {}

resource "azuread_application" "this" {
  count = var.application == null ? 1 : 0
  display_name = "sp-${var.display_name}"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "this" {
  count = var.application == null ? 1 : 0
  application_id               = local.application.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_password" "this" {
  application_object_id = local.application.object_id
  display_name          = var.azure_devops_project.name
}

resource "azuredevops_serviceendpoint_azurerm" "this" {
  project_id                = var.azure_devops_project.id
  service_endpoint_name     = "sc-azurerm-${var.display_name}-${var.service_connection_suffix}"
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name
  credentials {
    serviceprincipalid  = local.application.application_id
    serviceprincipalkey = azuread_application_password.this.value
  }
}
