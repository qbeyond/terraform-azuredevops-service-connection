# DevOps Service Connection
Use this module to create a service connection and the corresponding service principal.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.39.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | ~> 0.4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_devops_project"></a> [azure\_devops\_project](#input\_azure\_devops\_project) | Azure DevOps project to create the service connection in. | <pre>object({<br>    name = string<br>    id   = string<br>  })</pre> | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name of Service principal (prefix: `sp-`) and service connection (prefix: `sc-azurerm-`). | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | ID of subscription to create service connection to. | `string` | n/a | yes |
| <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name) | Name of subscription to create service connection to. | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant of the service principal. | `string` | n/a | yes |
| <a name="input_application"></a> [application](#input\_application) | Optional azuread\_application if one already exists. | <pre>object({<br>    object_id = string<br>    application_id = string<br>  })</pre> | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application"></a> [application](#output\_application) | Created azuread\_application by this module for reuse in other service connections or null if already exists. |
| <a name="output_service_endpoint"></a> [service\_endpoint](#output\_service\_endpoint) | Service Endpoint for the created service connection |
| <a name="output_service_principal_object_id"></a> [service\_principal\_object\_id](#output\_service\_principal\_object\_id) | Object Id of created Service Principle |

## Resource types

| Type | Used |
|------|-------|
| [azuread_application](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | 1 |
| [azuread_application_password](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | 1 |
| [azuread_service_principal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | 1 |
| [azuredevops_serviceendpoint_azurerm](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_azurerm) | 1 |

**`Used` only includes resource blocks.** `for_each` and `count` meta arguments, as well as resource blocks of modules are not considered.

## Modules

No modules.

## Resources by Files

### modules/devops_azurerm_service_connection/main.tf

| Name | Type |
|------|------|
| [azuread_application.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_service_principal.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azuredevops_serviceendpoint_azurerm.this](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_azurerm) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
<!-- END_TF_DOCS -->