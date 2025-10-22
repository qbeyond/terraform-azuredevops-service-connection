locals {
  application = {
    object_id = var.application == null ? azuread_application.this[0].object_id : var.application.app_registration_object_id
    client_id = var.application == null ? azuread_application.this[0].client_id : var.application.client_id
  }

  enterprise_application = {
    object_id = var.application == null ? azuread_service_principal.this[0].object_id : var.application.enterprise_application_object_id
    client_id = var.application == null ? azuread_service_principal.this[0].client_id : var.application.client_id
  }
  default_scope = "/subscriptions/${var.subscription_id}"
  
  permissions_resolved = (
    var.role_assignments != null
    ? { for index, assignment in var.role_assignments :
      "${index}" => {
        role  = assignment.role
        scope = assignment.scope != "" ? assignment.scope : local.default_scope
      }
    }
    : {}
  )


}
