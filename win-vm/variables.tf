#AzureVM Variables
variable "vm_name" {}
variable "vm_rg_name" {}
variable "nw_rg_name" {}
variable "vnet_name" {}
variable "subnet_name" {}

variable "location_name" {}
variable "disk_encryption_required" {}
variable "nbof_data_disk" {default = ""}
variable "ddisk_mount_required" {}

variable "vm_sku_type" {}
variable "osdisk_type" {}
variable "mddisk_type" {}
variable "mddisk_size" {}

variable "keyvault_rg_name" {}
variable "keyvault_name" {}
variable "key_name" {}

variable "diag_storage_name" {}

variable "tags" {
  default = {
    "Power Off" = "N"
  }
}
