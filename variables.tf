variable "instance_index" {
  type = number
  validation {
    condition     = var.instance_index > 0 && var.instance_index < 100
    error_message = "Must be a 2 dights number."
  }
  description = "Resource type index on the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Specifies the parent resource group name."
}

variable "caf_prefixes" {
  type        = list(string)
  default     = []
  description = "(Optional) Prefixes to use for caf naming."
}

variable "custom_location" {
  type        = string
  default     = ""
  description = "(Optional) Specifies a custom location for the resource."
}

variable "custom_name" {
  type        = string
  default     = ""
  description = "(Optional) Specifies a custom name for the resource."
}

variable "custom_tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) The custom tags to add on the resource."
}

variable "description" {
  type        = string
  default     = ""
  description = "(Optional) The resource description."
}

variable "enable_standard_analytics" {
  type        = bool
  default     = false
  description = "(Optional) Indicates if the log are sent to a specified log analytics workspace."
}

variable "global_parameters" {
  type = map(object({
    name  = string
    type  = string
    value = string
  }))
  default     = {}
  description = "(Optional) The global parameters to add on the resource."

  validation {
    condition = alltrue([
      for param in var.global_parameters : contains(["Array", "Bool", "Float", "Int", "Object", "String"], param.type)
    ])
    error_message = "Each global parameter type must be one of: Array, Bool, Float, Int, Object, or String."
  }
}

variable "identity_type" {
  description = "(Optional) Add an Identity (MSI) to the function app. Possible values are SystemAssigned or UserAssigned"
  type        = string
  default     = "SystemAssigned"
}

variable "managed_virtual_network_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Is Managed Virtual Network enabled?"
}

variable "monitoring_workspace_id" {
  type        = string
  default     = null
  description = "(Optional) If defined, the log analytics workspace id for monitoring logs."
}

variable "name_separator" {
  type        = string
  description = "(Optional) Name separator"
  default     = "-"
}

variable "standard_analytics_workspace_id" {
  type        = string
  default     = null
  description = "(Optional) If defined, the log analytics workspace id for standard logs. Mandatory if enable_standard_analytics is set to 'true'"
}

variable "user_assigned_identity_ids" {
  description = "(Optional) UserAssigned Identities ID to add to Function App. Mandatory if type is UserAssigned"
  type        = list(string)
  default     = null
}
