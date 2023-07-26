variable "azure_devops_project" {
  description = "Azure DevOps project to create the service connection in."
  type = object({
    name = string
    id   = string
  })
}

variable "display_name" {
  type = string
  description = "Display name of Service principal (prefix: `sp-`) and service connection (prefix: `sc-azurerm-`)."
}

variable "service_connection-suffix" {
  type = string
  description = "Suffix of the service connection name. Defaults to devops-01"
  default = "devops-01"
}

variable "subscription_id" {
  type = string
  description = "ID of subscription to create service connection to."
}

variable "subscription_name" {
  type = string
  description = "Name of subscription to create service connection to."
}

variable "tenant_id" {
  type = string
  description = "Tenant of the service principal."
}

variable "application" {
  type = object({
    object_id = string
    application_id = string
  })
  default = null
  description = "Optional azuread_application if one already exists."
}