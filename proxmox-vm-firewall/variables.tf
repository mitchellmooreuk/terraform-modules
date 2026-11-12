variable "node_name" {
  type        = string
  description = "(Required) The node name."
}

variable "vm_id" {
  type        = number
  description = "(Required) The identifier for the VM."
}

variable "input_policy" {
  type        = string
  description = "(Optional) The default policy for inbound traffic (defaults to DROP)."
  default     = "DROP"
}

variable "output_policy" {
  type        = string
  description = "(Optional) The default policy for outbound traffic (defaults to ACCEPT)."
  default     = "ACCEPT"
}

variable "dhcp" {
  type        = bool
  description = "(Optional) Whether DHCP traffic is allowed (defaults to false)."
  default     = false
}

variable "ndp" {
  type        = bool
  description = "(Optional) Whether NDP traffic is allowed (defaults to false)."
  default     = false
}

variable "radv" {
  type        = bool
  description = "(Optional) Whether the VM can send router advertisements (defaults to false)."
  default     = false
}

variable "rules" {
  type = list(object({
    comment = string
    source  = string
    proto   = string
    dport   = string
  }))
  description = "(Optional) A list of inbound traffic to accept."
  default     = []
}
