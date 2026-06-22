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
    for_each = var.disks != null ? { for disk in var.disks : disk.datastore_id => disk if var.bios == "ovmf" } : {}

    content {
      datastore_id      = efi_disk.key
      file_format       = efi_disk.value.file_format
      type              = efi_disk.value.type
      pre_enrolled_keys = efi_disk.value.pre_enrolled_keys
    }
  }

  dynamic "disk" {
    for_each = var.disks != null ? { for key, value in var.disks : key => value } : {}
    content {
      datastore_id = disk.value.datastore_id
      interface    = disk.value.interface
      size         = disk.value.size_gb
      iothread     = disk.value.io_thread
      file_id      = disk.value.file_id
      file_format  = disk.value.file_format
    }
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.gateway
      }
    }
    user_account {
      username = "ubuntu"
      keys     = [file("~/.ssh/id_rsa_terraform.pub")]
    }
  }

  dynamic "cdrom" {
    for_each = var.cd_roms != null ? { for key, value in var.cd_roms : key => value } : {}
    content {
      file_id   = cdrom.value.file_name
      interface = cdrom.value.interface
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
      operating_system,
    ]
  }
}
