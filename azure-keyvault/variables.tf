variable "global_settings" {
  description = "(Required) A map of global settings for the Key Vault."
}

variable "application_name" {
  description = "(Required) The name of the application."
  type        = string
}

variable "location" {
  description = "(Required) The Azure region where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group where the Key Vault will be created."
  type        = string
}

variable "tenant_id" {
  description = "(Required) The Azure AD tenant ID."
  type        = string
}

variable "sku_name" {
  description = "(Required) The SKU name for the Key Vault."
  type        = string
}

variable "tags" {
  description = "(Required) A map of tags to assign to the Key Vault."
  type        = map(string)
}
