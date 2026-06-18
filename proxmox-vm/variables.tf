/* Global Variables */
variable "tags" {
  type = map(string)
  description = "(Optional) A map of tags to add to the resource."
}

/* Module Specific Variables */
variable "bios" {
  type        = string
  default     = "ovmf"
  description = "The BIOS type (seabios or ovmf)"
}

variable "disks" {
  type = list(object({
    datastore_id = string
    size_gb      = number
    interface    = string
  }))
  default = []
}

variable "cpu_cores" {
  type = number
  description = "(Optional) The number of CPU cores (defaults to 1)."
}

variable "memory_mb" {
    type = number
    description = "(Optional) The dedicated memory in megabytes (defaults to 512)."
}

variable "node_name" {
  type        = string
  description = "(Optional) The name of the source node (leave blank, if equal to the node_name argument)."
}

variable "network_devices" {
  type = list(object({
    bridge      = string
    model       = string            
    vlan_id     = optional(number)  
    mac_address = optional(string)  
  }))
  description = ""
  default = []
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
  type = string
  description = "(Optional) The description."
}
