data "azuread_client_config" "current" {}

resource "azuread_application" "this" {
  count        = var.application == null ? 1 : 0
  display_name = "sp-${var.display_name}"
  owners       = [data.azuread_client_config.current.object_id]
}

data "azuread_application" "existing" {
  client_id = local.application.client_id
}

resource "azuread_service_principal" "this" {
  count                        = var.application == null ? 1 : 0
  client_id                    = local.application.client_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuredevops_serviceendpoint_azurerm" "this" {
  project_id                             = var.azure_devops_project.id
  service_endpoint_name                  = "sc-azurerm-${var.display_name}-${var.service_connection_suffix}"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  azurerm_spn_tenantid                   = var.tenant_id
  azurerm_subscription_id                = var.subscription_id
  azurerm_subscription_name              = var.subscription_name
  credentials {
    serviceprincipalid = local.application.client_id
  }
}

resource "azuread_application_federated_identity_credential" "this" {
  application_id = var.application == null ? azuread_application.this[0].id : data.azuread_application.existing.id
  display_name   = "wif-${azuredevops_serviceendpoint_azurerm.this.service_endpoint_name}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = azuredevops_serviceendpoint_azurerm.this.workload_identity_federation_issuer
  subject        = azuredevops_serviceendpoint_azurerm.this.workload_identity_federation_subject
}

resource "azurerm_role_assignment" "this" {
  for_each             = local.permissions_resolved
  principal_id         = local.enterprise_application.object_id
  role_definition_name = each.value.role
  scope                = each.value.scope
}
