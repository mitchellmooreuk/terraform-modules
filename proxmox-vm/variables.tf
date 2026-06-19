/* Global Variables */
variable "tags" {
  type        = list(string)
  description = "(Optional) A list of tags to add to the resource."
}

/* Module Specific Variables */
variable "bios" {
  type        = string
  default     = "ovmf"
  description = "(Required) The BIOS type (seabios or ovmf). When set to OVMF, an EFI disk will be also be created."
}

variable "disks" {
  type = list(object({
    datastore_id      = string
    size_gb           = number
    interface         = string
    io_thread         = optional(bool)
    file_format       = optional(string)
    type              = optional(string)
    pre_enrolled_keys = optional(bool)
  }))
  description = "(Optional) A list of disks to create for the VM. Each disk must specify a datastore_id, size_gb, and interface. The type and file_format attributes are required for EFI disks."
  default     = []
}

variable "cpu_cores" {
  type        = number
  description = "(Optional) The number of CPU cores (defaults to 1)."
  default     = 1
}

variable "cpu_type" {
  type        = string
  description = "(Optional) The CPU type (defaults to x86-64-v2-AES)."
  default     = "x86-64-v2-AES"
}

variable "memory_mb" {
  type        = number
  description = "(Optional) The dedicated memory in megabytes (defaults to 512)."
  default     = 512
}

variable "node_name" {
  type        = string
  description = "(Required) The name of the source node."
}

variable "network_devices" {
  type = list(object({
    bridge      = string
    model       = string
    vlan_id     = optional(number)
    mac_address = optional(string)
  }))
  description = "(Optional) A list of network devices to create for the VM."
  default     = []
}

variable "scsi_type" {
  type        = string
  description = "(Optional) The SCSI controller type (defaults to virtio-scsi-pci)."
  default     = "virtio-scsi-pci"
}

variable "vm_id" {
  type        = string
  description = "(Required) The identifier for the source VM."
}

variable "vm_name" {
  type        = string
  description = "(Required) The name of the VM you want to create."
}

variable "vm_description" {
  type        = string
  description = "(Optional) The description."
}
