variable "location" {
  type        = string
  default     = "westeurope"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the App Service and App Service Plan."
}

## App service plan

variable "plan_name" {
  type        = string
  description = "(Required) Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
}

variable "plan_kind" {
  type        = string
  description = "(Required) The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Changing this forces a new resource to be created."
}

variable "plan_sku_tier" {
  type        = string
  description = "(Required) Specifies the plan's pricing tier."
}

variable "plan_sku_size" {
  type        = string
  description = "(Required) Specifies the plan's instance size."
}

variable "plan_sku_capacity" {
  type        = number
  description = "(Optional) Specifies the number of workers associated with this App Service Plan."
  default     = 1
}

variable "plan_maximum_elastic_worker_count" {
  type        = number
  description = "The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  default     = null
}

variable "plan_reserved" {
  type        = bool
  description = "(Required) Is this App Service Plan Reserved. When creating a Linux App Service Plan, the reserved field must be set to true, and when creating a Windows/app App Service Plan the reserved field must be set to false."
}

variable "plan_per_site_scaling" {
  type        = bool
  description = "(Optional) Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan. Defaults to false."
  default     = false
}

## App service

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the App Service. Changing this forces a new resource to be created."
}

variable "client_cert_enabled" {
  type        = bool
  description = "(Optional) Does the App Service require client certificates for incoming requests? Defaults to false."
  default     = false
}

variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "always_on" {
  type        = bool
  description = "(Optional) Should the app be loaded at all times? Defaults to false."
  default     = false
}

# Ex. for linux "NODE|10-lts"
variable "linux_fx_version" {
  type        = string
  description = "(Optional) Linux App Framework and version for the App Service."
  default     = null
}

variable "app_command_line" {
  type        = string
  description = "(Optional) App command line to launch, e.g. /sbin/myserver -b 0.0.0.0."
  default     = null
}

variable "health_check_path" {
  type        = string
  description = "(Optional) The health check path to be pinged by App Service."
  default     = null
}

variable "allowed_subnets" {
  type        = list(string)
  description = "(Optional) List of subnet allowed to call the appserver endpoint."
  default     = []
}

variable "allowed_ips" {
  type        = list(string)
  description = "(Optional) List of ips allowed to call the appserver endpoint."
  default     = []
}

variable "subnet_name" {
  type        = string
  description = "(Optional) Subnet name wether you want to integrate the app service to a subnet."
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "(Optional) Subnet id wether you want to integrate the app service to a subnet."
  default     = null
}

variable "tags" {
  type = map(any)
}
