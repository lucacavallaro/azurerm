output "id" {
  value = azurerm_function_app.this.id
}

output "name" {
  value = var.name
}

output "default_hostname" {
  value     = azurerm_function_app.this.default_hostname
  sensitive = true
}

output "possible_outbound_ip_addresses" {
  value = azurerm_function_app.this.possible_outbound_ip_addresses
}

output "default_key" {
  value     = var.export_keys ? data.azurerm_function_app_host_keys.this[0].default_function_key : null
  sensitive = true
}

output "master_key" {
  value     = var.export_keys ? data.azurerm_function_app_host_keys.this[0].master_key : null
  sensitive = true
}

output "app_service_plan_id" {
  value = var.app_service_plan_id != null ? var.app_service_plan_id : azurerm_app_service_plan.this[0].id
}

output "storage_account" {
  value = {
    name                      = module.storage_account.name
    primary_access_key        = module.storage_account.primary_access_key
    primary_connection_string = module.storage_account.primary_connection_string
  }
  sensitive = true
}

output "storage_account_durable_function" {
  value = var.durable_function.enable ? {
    name                      = module.storage_account_durable_function[0].name
    primary_access_key        = module.storage_account_durable_function[0].primary_access_key
    primary_connection_string = module.storage_account_durable_function[0].primary_connection_string
  } : null
  sensitive = true
}

output "resource_name" {
  value = local.resource_name
}