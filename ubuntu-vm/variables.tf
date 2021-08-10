#AzureVM Variables
variable "vm_name" {}
variable "vm_rg_name" {}
variable "nw_rg_name" {}
variable "vnet_name" {}
variable "subnet_name" {}

variable "location_name" {}
variable "nbof_data_disk" {default = ""}

variable "vm_sku_type" {}
variable "osdisk_type" {}
variable "mddisk_type" {}
variable "mddisk_size" {}

variable "diag_storage_name" {}

variable "tags" {
  default = {
    "Power Off" = "N"
  }
}
