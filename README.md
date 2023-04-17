# Azure Aware Data Factory

[![Build Status](https://dev.azure.com/weareretail/Tooling/_apis/build/status/mod_azu_data_factory?repoName=mod_azu_data_factory&branchName=master)](https://dev.azure.com/weareretail/Tooling/_build/latest?definitionId=11&repoName=mod_azu_data_factory&branchName=master)[![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)

Common Azure Terraform module to normalize Azure Data Factory creation.

# Usage

```hcl
module "aware_datafactory" {
  source = "weareretail/datafactory/azurerm"

  instance_index                  = 1
  resource_group_name             = "resource_group_name"
  description                     = "Datalake provisionning Datafactory"
  caf_prefixes                    = ["caf", "prefixes", "for", "naming"]
  standard_analytics_workspace_id = "/subscriptions/XXX/resourcegroups/YYYY/providers/microsoft.operationalinsights/workspaces/adf_workspace"
  enable_standard_analytics       = true
  identity_type                   = "UserAssigned"
  user_assigned_identity_ids      = [/subscriptions/XXX/resourcegroups/YYYY/providers/Microsoft.ManagedIdentity/userAssignedIdentities/adf_managed_identity]
  managed_virtual_network_enabled = true
  name_separator                  = ""
}

```

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >= 1.2.16 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.44.0 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_index"></a> [instance\_index](#input\_instance\_index) | Resource type index on the resource group. | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the parent resource group name. | `string` | n/a | yes |
| <a name="input_caf_prefixes"></a> [caf\_prefixes](#input\_caf\_prefixes) | Prefixes to use for caf naming. | `list(string)` | `[]` | no |
| <a name="input_custom_location"></a> [custom\_location](#input\_custom\_location) | Specifies a custom location for the resource. | `string` | `""` | no |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | Specifies a custom name for the resource. | `string` | `""` | no |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | The custom tags to add on the resource. | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | The resource description. | `string` | `""` | no |
| <a name="input_enable_standard_analytics"></a> [enable\_standard\_analytics](#input\_enable\_standard\_analytics) | Indicates if the log are sent to a specified log analytics workspace. | `bool` | `false` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Add an Identity (MSI) to the function app. Possible values are SystemAssigned or UserAssigned | `string` | `"SystemAssigned"` | no |
| <a name="input_managed_virtual_network_enabled"></a> [managed\_virtual\_network\_enabled](#input\_managed\_virtual\_network\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_metrics_retention_days"></a> [metrics\_retention\_days](#input\_metrics\_retention\_days) | Metrics retention days. | `number` | `30` | no |
| <a name="input_monitoring_workspace_id"></a> [monitoring\_workspace\_id](#input\_monitoring\_workspace\_id) | If defined, the log analytics workspace id for monitoring logs. | `string` | `null` | no |
| <a name="input_name_separator"></a> [name\_separator](#input\_name\_separator) | Name separator | `string` | `"-"` | no |
| <a name="input_standard_analytics_workspace_id"></a> [standard\_analytics\_workspace\_id](#input\_standard\_analytics\_workspace\_id) | If defined, the log analytics workspace id for standard logs. Mandatory if enable\_standard\_analytics is set to 'true' | `string` | `null` | no |
| <a name="input_user_assigned_identity_ids"></a> [user\_assigned\_identity\_ids](#input\_user\_assigned\_identity\_ids) | UserAssigned Identities ID to add to Function App. Mandatory if type is UserAssigned | `list(string)` | `null` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The factory id |
| <a name="output_identity"></a> [identity](#output\_identity) | The assigned identity. |
| <a name="output_name"></a> [name](#output\_name) | The instance name. |
<!-- END_TF_DOCS -->
