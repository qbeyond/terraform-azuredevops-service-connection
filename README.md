# Module
[![GitHub tag](https://img.shields.io/github/tag/qbeyond/terraform-module-template.svg)](https://registry.terraform.io/modules/qbeyond/terraform-module-template/provider/latest)
[![License](https://img.shields.io/github/license/qbeyond/terraform-module-template.svg)](https://github.com/qbeyond/terraform-module-template/blob/main/LICENSE)

----

This is a template module. It just showcases how a module should look. This would be a short description of the module.

<!-- BEGIN_TF_DOCS -->
## Usage

It's very easy to use!
```hcl
terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.36.0"
    }
  }
}

data "azuredevops_project" "this" {
  name = "<ProjectName>"
}

module "service_connection_eslz" {
  source               = "qbeyond/service-connection/azuredevops"
  version              = "v1.0.0"
  subscription_id      = "<subscriptionID>"
  subscription_name    = "<subscriptionName>"
  display_name         = "DisplayName"
  azure_devops_project = data.azuredevops_project.this
  tenant_id            = "<TenantID>"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.22.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | 0.3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_devops_project"></a> [azure\_devops\_project](#input\_azure\_devops\_project) | Azure DevOps Project to create the Service COnnection in. | <pre>object({<br>    name = string<br>    id   = string<br>  })</pre> | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display Name of Service Principal (prefix: `sp-`) and Service connection (prefix: `sc-azurerm-`). | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Id of subscription to create service connection to. | `string` | n/a | yes |
| <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name) | Name of subscription to create service connection to. | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant of the service principal | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_endpoint"></a> [service\_endpoint](#output\_service\_endpoint) | Service Endpoint for the created service connection |
| <a name="output_service_principle_object_id"></a> [service\_principle\_object\_id](#output\_service\_principle\_object\_id) | Object Id of created Service Principle |

## Resource types

| Type | Used |
|------|-------|
| [azuread_application](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/resources/application) | 1 |
| [azuread_application_password](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/resources/application_password) | 1 |
| [azuread_service_principal](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/resources/service_principal) | 1 |
| [azuredevops_serviceendpoint_azurerm](https://registry.terraform.io/providers/microsoft/azuredevops/0.3.0/docs/resources/serviceendpoint_azurerm) | 1 |

**`Used` only includes resource blocks.** `for_each` and `count` meta arguments, as well as resource blocks of modules are not considered.

## Modules

No modules.

## Resources by Files

### main.tf

| Name | Type |
|------|------|
| [azuread_application.this](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/resources/application) | resource |
| [azuread_application_password.this](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/resources/application_password) | resource |
| [azuread_service_principal.this](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/resources/service_principal) | resource |
| [azuredevops_serviceendpoint_azurerm.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.3.0/docs/resources/serviceendpoint_azurerm) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/2.22.0/docs/data-sources/client_config) | data source |
<!-- END_TF_DOCS -->

## Contribute

Please use Pull requests to contribute.

When a new Feature or Fix is ready to be released, create a new Github release and adhere to [Semantic Versioning 2.0.0](https://semver.org/lang/de/spec/v2.0.0.html).