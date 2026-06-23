## Disclaimer: This README file was generated with AI. It was reviewed by Mitchell Moore.

# proxmox-download-image

Terraform module to download an image file into Proxmox using the `proxmox_virtual_environment_download_file` resource from the `bpg/proxmox` provider.

## Requirements

- Terraform 1.5.0 or newer
- Provider `bpg/proxmox` configured in the root module

## Usage

```hcl
module "proxmox_download_image" {
  source       = "../proxmox-download-image"
  content_type = "iso"
  datastore_id = "local"
  node_name    = "proxmox-node"
  url          = "https://example.com/path/to/ubuntu.iso"
  file_name    = "ubuntu.iso"
}
```

## Inputs

- `content_type` (string)
  - Required. The file content type. Must be `iso` or `import` for VM images, or `vztmpl` for LXC templates.

- `datastore_id` (string)
  - Required. The identifier for the target datastore.

- `node_name` (string)
  - Required. The Proxmox node name.

- `url` (string)
  - Required. The URL to download the file from. Must be a valid HTTP or HTTPS URL.

- `file_name` (string)
  - Required. The file name to use inside Proxmox. Some Proxmox versions may reject popular extensions like `.raw` or `.qcow2`; using `.img` can be a practical workaround.

## Outputs

- `file_id`
  - The ID of the downloaded file resource.

## Notes

- Ensure the `bpg/proxmox` provider is configured in your root module before using this module.
- Use `content_type = "import"` when importing raw disk images for VM import workflows.
- If the source URL filename extension is not accepted by Proxmox, override it with a compatible `file_name` value.

## File locations

Main implementation: [module.tf](module.tf)
Input definitions: [variables.tf](variables.tf)
Outputs: [outputs.tf](outputs.tf)
