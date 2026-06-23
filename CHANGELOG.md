---

### `CHANGELOG.md`

AI was used to generate this file! This uses a simplified version of the standard Keep a Changelog format, grouping your recent refactoring milestones chronologically.

```markdown
# Changelog

All notable changes to this project will be documented in this file. This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
---
## [1.8.1] - 23.06.2026
### Added
- Initialization block to the ignore lifecycle, as we do not want it to change after the machine has been provisioned.
### Changed 
- 
### Removed
- 
---
## [1.8.0] - 22.06.2026
### Added
- Support for specifying an ipv4_address that the machine should initialize with
- Support for specifying a gateway that the machine should initialize with
- A conditional to the "cdrom" dynamic block, to prevent an error upon the block being null or an empty list
### Changed 
- Removed things from ignore_lifecycle that did not need to be ignored
### Removed
- Template functionality
---
## [1.7.0] - 21.06.2026
### Added
- Adds ability to create template VMs
### Changed 
- 
### Removed
- 
---
## [1.6.1] - 19.06.2026
### Added
- Hardcodes module tag
### Changed 
- 
### Removed
- 
---
## [1.6.0] - 19.06.2026
### Added
- Locked down firewall rules of the key vault in the azure-keyvault module
### Changed 
- 
### Removed
- 
---
## [1.5.0] - 19.06.2026
### Added
- cd_roms to proxmox-vm module
### Changed 
- 
### Removed
- 
---
## [1.4.0] - 19.06.2026
### Added
- key vault module
### Changed 
- minor changes to proxmox-vm module
### Removed
- 
---
## [1.3.0] - 19.06.2026
### Added
- scsi_hardware attribute
- bios attribute
- cpu.type attribute
- lifecycle block to ignore changes
### Changed 
- var.disks to include several attributes
- variables.tf to match the formatting of module.tf
### Removed
- Redundant outputs in output.tf
---
## [1.2.1] - 18.06.2026
### Added
- efi_disk type attribute to 2m
### Changed 
- 
### Removed
- 
---
## [1.2.0] - 18.06.2026
### Added
- efi_disk type attribute
### Changed 
- 
### Removed
- 
---
## [1.1.1] - 18.06.2026
### Added
- 
### Changed 
- var.tags to a list of string as it should be.
### Removed
- 
---
## [1.1.0] - 18.06.2026
### Added
- Tags to the proxmox_virtual_environment_vm resource in the proxmox-vm module.
- A README to the proxmox-vm module.
### Changed 
- 
### Removed
- 
---
## [1.0.0] - 18.06.2026 

### Added
- Initial release containing the baseline `pve-vm` compute module structure using the `bpg/proxmox` provider ecosystem.
### Changed
- 
### Removed
- 
---
