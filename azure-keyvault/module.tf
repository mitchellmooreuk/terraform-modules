resource "azurecaf_name" "caf_name_azure_keyvault" {
  name          = var.application_name
  resource_type = "azurerm_key_vault"
  prefixes      = var.global_settings.prefixes
  suffixes      = var.global_settings.suffixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_key_vault" "this" {
  name                       = azurecaf_name.caf_name_azure_keyvault.result
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = var.tenant_id
  sku_name                   = var.sku_name
  soft_delete_retention_days = 7
  rbac_authorization_enabled = true

  network_acls {
    default_action = "Deny"
    bypass         = "None"
  }

  tags = local.tags
}
