resource "proxmox_virtual_environment_vm" "this" {
  vm_id       = var.vm_id
  name        = var.vm_name
  description = var.vm_description
  tags        = var.tags

  node_name = var.node_name

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory_mb
  }

  dynamic "efi_disk" {
    for_each = var.bios == "ovmf" ? [1] : []
    content {
      datastore_id = "local-lvm" # Or whichever storage handles your EFI vars
      file_format  = "raw"
      type         = efi_disk.value.type
    }
  }

  # Dynamic disk layout loop
  dynamic "disk" {
    for_each = { for key, value in var.disks : key => value }
    content {
      datastore_id = disk.value.datastore_id
      size         = disk.value.size_gb
      interface    = disk.value.interface

    }
  }

  dynamic "network_device" {
    for_each = { for key, value in var.network_devices : key => value }
    content {
      bridge      = network_device.value.bridge
      model       = network_device.value.model
      vlan_id     = network_device.value.vlan_id
      mac_address = network_device.value.mac_address
    }
  }
}
