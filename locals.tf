locals {
  application = {
    object_id = var.application == null ? azuread_application.this[0].object_id : var.application.object_id
    application_id = var.application == null ? azuread_application.this[0].application_id : var.application.application_id
  }
}
