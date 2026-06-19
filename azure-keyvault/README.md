# azure-keyvault

Terraform module to create an Azure Key Vault using `azurerm` with CAF-compliant naming via `azurecaf`.

## Requirements

- Terraform 1.5.0+ (recommended)
- Provider `hashicorp/azurerm` (>= 4.78.0)
- Provider `aztfmod/azurecaf`

## Usage

```hcl
module "keyvault" {
	source = "../azure-keyvault"

	global_settings = {
		prefixes       = ["pfx"]
		suffixes       = ["sfx"]
		random_length  = 4
		passthrough    = false
		use_slug       = true
	}

	application_name    = "myapp"
	location            = "eastus"
	resource_group_name = "rg-example"
	tenant_id           = "00000000-0000-0000-0000-000000000000"
	sku_name            = "standard"
	tags = {
		environment = "dev"
		owner       = "team"
	}
}
```

## Inputs

- **`global_settings`**: (Required) A map of CAF naming settings used by `azurecaf_name`. Expected keys: `prefixes`, `suffixes`, `random_length`, `passthrough`, `use_slug`.
- **`application_name`**: (Required) The name of the application used to build the Key Vault name.
- **`location`**: (Required) Azure region where the Key Vault will be created.
- **`resource_group_name`**: (Required) Resource Group name for the Key Vault.
- **`tenant_id`**: (Required) Azure AD tenant ID.
- **`sku_name`**: (Required) SKU for the Key Vault (for example `standard` or `premium`).
- **`tags`**: (Required) Map of tags to assign to the Key Vault.

## Outputs

- **`keyvault_id`**: The resource ID of the created Key Vault (`azurerm_key_vault.this.id`).

## Notes

- The module uses `azurecaf_name` to create a CAF-compliant name for the Key Vault from `application_name` and `global_settings`.
- The Key Vault is created with `rbac_authorization_enabled = true` and `soft_delete_retention_days = 7` by default in the module.
- Ensure you configure the `azurerm` provider in your root module with proper credentials and subscription context before using this module.

## File locations

Main implementation: [azure-keyvault/module.tf](azure-keyvault/module.tf)

