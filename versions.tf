terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.31.0"
    }

    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = ">= 1.2.0"
    }
  }
}
