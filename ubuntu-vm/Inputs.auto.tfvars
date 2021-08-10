vm_name     = "RHELVMREACT"
vm_rg_name  = "common-rg"
nw_rg_name  = "network-rg"
vnet_name   = "corp-vnet-01"
subnet_name = "WinSubnet01"

vm_sku_type     = "Standard_D2S_V3"
osdisk_type     = "Premium_LRS"
mddisk_type     = "Premium_LRS"
mddisk_size     = "16"
nbof_data_disk  = "1"
location_name   = "westeurope"

diag_storage_name = "https://vmbootdaigsa01.blob.core.windows.net/"

tags = {  
  "CostCenter"    = "Personal"
  "Dept"          = "Community"
  "Maintainer"    = "Azure ArjunReddy"
  "Power Off"     = "Y"
}
