locals {
  module_tag = {
    "module" = "azure-keyvault"
  }
  tags = merge(local.module_tag, var.tags)
}
