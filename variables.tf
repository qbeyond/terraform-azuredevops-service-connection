variable "azure_devops_project" {
  description = "Azure DevOps Project to create the Service COnnection in."
  type = object({
    name = string
    id   = string
  })
}

variable "display_name" {
  type = string
  description = "Display Name of Service Principal (prefix: `sp-`) and Service connection (prefix: `sc-azurerm-`)."
}

variable "subscription_id" {
  type = string
  description = "Id of subscription to create service connection to."
}

variable "subscription_name" {
  type = string
  description = "Name of subscription to create service connection to."
}

variable "tenant_id" {
  type = string
  description = "Tenant of the service principal"
}