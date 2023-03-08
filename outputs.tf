output "service_principle_object_id" {
  value       = azuread_service_principal.this.object_id
  description = "Object Id of created Service Principle"
}

output "service_endpoint" {
  value = azuredevops_serviceendpoint_azurerm.this
  description = "Service Endpoint for the created service connection"
}