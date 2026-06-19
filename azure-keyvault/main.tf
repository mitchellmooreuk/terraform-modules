terraform {
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.78.0"
    }
  }
}
