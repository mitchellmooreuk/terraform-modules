## Disclaimer: This README file was generated with AI. It was reviewed by Mitchell Moore.

# proxmox-vm-firewall

Terraform module to manage the Proxmox firewall for a single VM using the `proxmox_virtual_environment_firewall_options` and `proxmox_virtual_environment_firewall_rules` resources from the `bpg/proxmox` provider. The `proxmox-vm` module calls this for any VM with a network device that has `firewall` set.

## Requirements

- Terraform 1.5.0 or newer
- Provider `bpg/proxmox` configured in the root module
- The firewall enabled at datacenter level in Proxmox

## Usage

```hcl
module "proxmox_vm_firewall" {
  source    = "../proxmox-vm-firewall"
  node_name = "proxmox-node"
  vm_id     = 100

  rules = [
    {
      comment = "SSH from the control host"
      source  = "192.0.2.10"
      proto   = "tcp"
      dport   = "22"
    }
  ]
}
```

## Inputs

- `node_name` (string)
  - Required. The Proxmox node name.

- `vm_id` (number)
  - Required. The identifier for the VM.

- `input_policy` (string, default: `DROP`)
  - The default policy for inbound traffic.

- `output_policy` (string, default: `ACCEPT`)
  - The default policy for outbound traffic.

- `dhcp` (bool, default: `false`)
  - Whether DHCP traffic is allowed.

- `ndp` (bool, default: `false`)
  - Whether NDP traffic is allowed.

- `radv` (bool, default: `false`)
  - Whether the VM can send router advertisements.

- `rules` (list(object), default: `[]`)
  - A list of inbound traffic to accept. Each rule must include:
    - `comment` (string)
    - `source` (string)
    - `proto` (string)
    - `dport` (string)
