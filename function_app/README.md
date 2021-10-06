<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_secrets_from_keyvault"></a> [secrets\_from\_keyvault](#module\_secrets\_from\_keyvault) | git::https://github.com/pagopa/azurerm.git//key_vault_secrets_query | v1.0.58 |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | git::https://github.com/pagopa/azurerm.git//storage_account | v1.0.58 |
| <a name="module_storage_account_durable_function"></a> [storage\_account\_durable\_function](#module\_storage\_account\_durable\_function) | git::https://github.com/pagopa/azurerm.git//storage_account | v1.0.58 |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | git::git@github.com:pagopa/azurerm.git//azurerm_subnet | v1.0.5 |

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_plan.app_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_app_service_virtual_network_swift_connection.app_service_virtual_network_swift_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_function_app.function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app) | resource |
| [azurerm_private_endpoint.private_endpoint_blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.private_endpoint_queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.private_endpoint_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_function_app_host_keys.app_host_keys](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/function_app_host_keys) | data source |
| [azurerm_key_vault_secret.allowed_ips_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advanced_threat_protection_enable"></a> [advanced\_threat\_protection\_enable](#input\_advanced\_threat\_protection\_enable) | Enable advanced threat protection on the storage accounts | `bool` | `false` | no |
| <a name="input_allowed_ips"></a> [allowed\_ips](#input\_allowed\_ips) | n/a | `list(string)` | `[]` | no |
| <a name="input_allowed_ips_secret"></a> [allowed\_ips\_secret](#input\_allowed\_ips\_secret) | n/a | <pre>object({<br>    key_vault_id     = string<br>    key_vault_secret = string<br>  })</pre> | `null` | no |
| <a name="input_allowed_subnets"></a> [allowed\_subnets](#input\_allowed\_subnets) | n/a | `list(string)` | `[]` | no |
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | The app service plan id to associate to the function. If null a new plan is created, if not null the app\_service\_plan\_info is not relevant. | `string` | `null` | no |
| <a name="input_app_service_plan_info"></a> [app\_service\_plan\_info](#input\_app\_service\_plan\_info) | n/a | <pre>object({<br>    kind     = string<br>    sku_tier = string<br>    sku_size = string<br>  })</pre> | <pre>{<br>  "kind": "elastic",<br>  "sku_size": "EP1",<br>  "sku_tier": "ElasticPremium"<br>}</pre> | no |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | n/a | `map(any)` | `{}` | no |
| <a name="input_app_settings_secrets"></a> [app\_settings\_secrets](#input\_app\_settings\_secrets) | n/a | <pre>object({<br>    name             = string<br>    resource_group   = string<br>    secrets          = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_application_insights_instrumentation_key"></a> [application\_insights\_instrumentation\_key](#input\_application\_insights\_instrumentation\_key) | n/a | `string` | n/a | yes |
| <a name="input_avoid_old_subnet_delete"></a> [avoid\_old\_subnet\_delete](#input\_avoid\_old\_subnet\_delete) | n/a | `bool` | `false` | no |
| <a name="input_cors"></a> [cors](#input\_cors) | n/a | <pre>object({<br>    allowed_origins = list(string)<br>  })</pre> | `null` | no |
| <a name="input_durable_function"></a> [durable\_function](#input\_durable\_function) | n/a | <pre>object({<br>    enable                     = bool<br>    private_endpoint_subnet_id = string<br>    private_dns_zone_blob_ids  = list(string)<br>    private_dns_zone_queue_ids = list(string)<br>    private_dns_zone_table_ids = list(string)<br>  })</pre> | <pre>{<br>  "enable": false,<br>  "private_dns_zone_blob_ids": [],<br>  "private_dns_zone_queue_ids": [],<br>  "private_dns_zone_table_ids": [],<br>  "private_endpoint_subnet_id": "dummy"<br>}</pre> | no |
| <a name="input_environment_short"></a> [environment\_short](#input\_environment\_short) | n/a | `string` | n/a | yes |
| <a name="input_global_prefix"></a> [global\_prefix](#input\_global\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_health_check_maxpingfailures"></a> [health\_check\_maxpingfailures](#input\_health\_check\_maxpingfailures) | n/a | `number` | `10` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | n/a | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_pre_warmed_instance_count"></a> [pre\_warmed\_instance\_count](#input\_pre\_warmed\_instance\_count) | n/a | `number` | `1` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_resources_prefix"></a> [resources\_prefix](#input\_resources\_prefix) | n/a | <pre>object({<br>    function_app     = string<br>    app_service_plan = string<br>    storage_account  = string<br>  })</pre> | <pre>{<br>  "app_service_plan": "f",<br>  "function_app": "func",<br>  "storage_account": "f"<br>}</pre> | no |
| <a name="input_runtime_version"></a> [runtime\_version](#input\_runtime\_version) | n/a | `string` | `"~2"` | no |
| <a name="input_storage_account_info"></a> [storage\_account\_info](#input\_storage\_account\_info) | n/a | <pre>object({<br>    account_tier                      = string<br>    account_replication_type          = string<br>    access_tier                       = string<br>    advanced_threat_protection_enable = bool<br>  })</pre> | <pre>{<br>  "access_tier": "Hot",<br>  "account_replication_type": "LRS",<br>  "account_tier": "Standard",<br>  "advanced_threat_protection_enable": false<br>}</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_virtual_network_info"></a> [virtual\_network\_info](#input\_virtual\_network\_info) | n/a | <pre>object({<br>    name                  = string<br>    resource_group_name   = string<br>    subnet_address_prefix = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_plan_id"></a> [app\_service\_plan\_id](#output\_app\_service\_plan\_id) | n/a |
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | n/a |
| <a name="output_default_key"></a> [default\_key](#output\_default\_key) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_master_key"></a> [master\_key](#output\_master\_key) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | n/a |
| <a name="output_resource_name"></a> [resource\_name](#output\_resource\_name) | n/a |
| <a name="output_storage_account"></a> [storage\_account](#output\_storage\_account) | n/a |
| <a name="output_storage_account_durable_function"></a> [storage\_account\_durable\_function](#output\_storage\_account\_durable\_function) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
<!-- END_TF_DOCS -->