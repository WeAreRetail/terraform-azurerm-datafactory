locals {
  specific_tags = {
    "description" = var.description
  }

  enable_standard_metrics   = var.enable_standard_analytics
  enable_monitoring_metrics = var.monitoring_workspace_id != null

  logs    = ["PipelineRuns", "TriggerRuns", "ActivityRuns"]
  metrics = ["AllMetrics"]

  location      = coalesce(var.custom_location, data.azurerm_resource_group.parent_group.location)
  parent_tags   = { for n, v in data.azurerm_resource_group.parent_group.tags : n => v if n != "description" }
  resource_name = coalesce(var.custom_name, azurecaf_name.self.result)
  tags          = { for n, v in merge(local.parent_tags, local.specific_tags, var.custom_tags) : n => v if v != "" }

  user_assigned_identity_enabeld = length(regexall("UserAssigned.*", var.identity_type)) > 0
}

data "azurerm_resource_group" "parent_group" {
  name = var.resource_group_name
}

resource "azurecaf_name" "self" {
  name          = format("%02d", var.instance_index)
  resource_type = "azurerm_data_factory"
  prefixes      = var.caf_prefixes
  suffixes      = []
  use_slug      = true
  clean_input   = true
  separator     = var.name_separator
}


resource "azurerm_data_factory" "factory" {
  name                            = local.resource_name
  location                        = local.location
  resource_group_name             = data.azurerm_resource_group.parent_group.name
  tags                            = local.tags
  managed_virtual_network_enabled = var.managed_virtual_network_enabled

  dynamic "identity" {
    for_each = ["mock_iterator"]
    content {
      type         = var.identity_type
      identity_ids = local.user_assigned_identity_enabeld ? var.user_assigned_identity_ids : null
    }
  }

  lifecycle {
    ignore_changes = [vsts_configuration, github_configuration, global_parameter]
  }
}
