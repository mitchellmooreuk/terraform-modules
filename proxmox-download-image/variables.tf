variable "content_type" {
  type        = string
  description = "(Required) The file content type. Must be iso or import for VM images or vztmpl for LXC images."
}

variable "datastore_id" {
  type        = string
  description = "(Required) The identifier for the target datastore."
}

variable "node_name" {
  type        = string
  description = "(Required) The node name."
}

variable "url" {
  type        = string
  description = "(Required) The URL to download the file from. Must match regex: https?://.*."
}

variable "file_name" {
  type        = string
  description = "(Optional) The file name. If not provided, it is calculated using url. PVE will raise 'wrong file extension' error for some popular extensions file .raw or .qcow2 on PVE versions prior to 8.4. Workaround is to use e.g. .img instead."
  default     = null
}
