#AzureRM Variables
variable "node_count" {}
variable "vm_name" {}
variable "app" {}
variable "ddisk_mount_required" {}
variable "nb_of_ddisk" {}
variable "zones" {
  default = [
    "1",
    "2"]
}

variable "vm_sku_type" {}
variable "win_license_type" {}
variable "osdisk_type" {}
variable "osdisk_size" {}
variable "public_ip_required" {}
variable "ip_type" {}
variable "ip_addr" {}
variable "disk_encryption_required" {}
variable "nw_watcher_required" {}
variable "static_ip_required" {}
variable "enable_log_analytics" {}
variable delete_os_disk {
  description = "Boolean flag which controls if delete disk is enabled."
  type        = bool
  default     = true
}
variable "mddisk_type" {}
variable "mddisk_size" {}
variable "data_disk_required" {}
variable delete_data_disks {
  description = "Boolean flag which controls if delete disk is enabled."
  type        = bool
  default     = false
}
variable "location_name" {}
variable "vm_rg_name" {}
variable "nw_rg_name" {}
variable "vnet_name" {}
variable "subnet_name" {}
variable "enable_accelerated_nw" {
  description = "Boolean flag which controls if accelerated networking is enabled."
  type        = bool
  default     = false
}
variable "vm_username" {}
variable "vm_password" {}
variable "agntType" {}
variable "nwwType" {}
variable "keyvault_rg_name" {}
variable "keyvault_name" {}
variable "key_name" {}

variable "tags" {
  default = {
    "Power Off" = "N"
  }
}

variable "diag_storage_name" {}
variable "os_mk_img_publisher" { default = ""}
variable "os_mk_img_offer" {default = ""}
variable "os_mk_img_sku" {default = ""}
variable "os_mk_img_version" {default = ""}
variable "os_cs_img_required" { default = false }
variable "os_cs_img_id" {}