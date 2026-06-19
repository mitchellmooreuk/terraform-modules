output "keyvault_id" {
  value       = azurerm_key_vault.this.id
  description = "The ID of the Key Vault."
}