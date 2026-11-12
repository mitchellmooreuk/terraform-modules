resource "proxmox_virtual_environment_firewall_options" "this" {
  node_name = var.node_name
  vm_id     = var.vm_id

  enabled       = true
  input_policy  = var.input_policy
  output_policy = var.output_policy
  dhcp          = var.dhcp
  ndp           = var.ndp
  radv          = var.radv
}

resource "proxmox_virtual_environment_firewall_rules" "this" {
  count = length(var.rules) > 0 ? 1 : 0

  node_name = var.node_name
  vm_id     = var.vm_id

  dynamic "rule" {
    for_each = var.rules
    content {
      type    = "in"
      action  = "ACCEPT"
      comment = rule.value.comment
      source  = rule.value.source
      proto   = rule.value.proto
      dport   = rule.value.dport
    }
  }
}
