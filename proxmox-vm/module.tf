resource "proxmox_virtual_environment_vm" "this" {
  vm_id       = var.vm_id
  name        = var.vm_name
  description = var.vm_description
  tags        = var.tags

  node_name = var.node_name

  scsi_hardware = var.scsi_type

  bios = var.bios

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  memory {
    dedicated = var.memory_mb
  }

  dynamic "efi_disk" {
    for_each = { for disk in var.disks : disk.datastore_id => disk if var.bios == "ovmf" }

    content {
      datastore_id      = efi_disk.key
      file_format       = efi_disk.value.file_format
      type              = efi_disk.value.type
      pre_enrolled_keys = efi_disk.value.pre_enrolled_keys
    }
  }

  # Dynamic disk layout loop
  dynamic "disk" {
    for_each = { for key, value in var.disks : key => value }
    content {
      datastore_id = disk.value.datastore_id
      size         = disk.value.size_gb
      interface    = disk.value.interface
      iothread     = disk.value.io_thread
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

  lifecycle {
    ignore_changes = [
      operating_system
    ]
  }
}
