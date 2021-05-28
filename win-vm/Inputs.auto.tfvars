node_count                = "4"         # No Of VM's to create
vm_name                   = "WEUWVM"        # VM Name
app                       = "ABC"       # Worload Name
zones                     = [1,2,3]         # Min 1 & Max 3, Example : zones= [1] / [1,2] / [1,2,3]

public_ip_required        = "false"
static_ip_required        = "true"
disk_encryption_required  = "false"
data_disk_required        = "false"
nb_of_ddisk               = "0"
ddisk_mount_required      = "false"
enable_accelerated_nw     = "false"
ip_type                   = "Dynamic"   # [Dynamic / Static]
ip_addr                   = ""          # [In case of ip_type = Static Provide IP Address ]
os_cs_img_required        = "false"
win_license_type          = ""	        # [Blank Value("") for Not Using Hybrid Benefit / Windows_Server for Win 2016/2019 DC / Windows_Client for Win 10]

vm_sku_type = "Standard_B1ms" # VM SKU Model which is available in WEU region
osdisk_type = "Standard_LRS"  # OS Disk-Type Premium_LRS / Standard_LRS
osdisk_size = ""              # OS Disk-Size in GB [32, 128, 256, 1024]
mddisk_type = ""              # Data Disk-Type Premium_LRS / Standard_LRS
mddisk_size = ""              # Data Disk-Size in GB [8, 16, 32, 64, 128, 256, 512, 1024]

vm_rg_name    = "abc-vm-rg" # VM RG Name

nw_rg_name  = "network-rg"       # N/W resourceGroup Name
vnet_name   = "tungamalli-vnet"  # N/W VNet Name
subnet_name = "ABCCorpSubnet01"  # Sub Net Name

keyvault_rg_name = "keyvault-rg"      # Key Vault resourceGroup
keyvault_name    = "diskencry-kv"     # Key Vault Name
key_name         = "DiskEncKey"       # Key Name

diag_storage_name = "https://weubootdaigsa01.blob.core.windows.net/" # For Boot Diagnostics

os_cs_img_id = ""
os_mk_img_publisher   = "MicrosoftWindowsServer"
os_mk_img_offer       = "WindowsServer"
os_mk_img_sku         = "2019-Datacenter"
os_mk_img_version     = "latest"

tags = {  
  "CostCenter"    = "Personal"
  "Dept"          = "Community"
  "Maintainer"    = "Tunga Malli"
  "Power Off"     = "Y"
}
//---------------------------------------------------------------------------------
vm_username    = "dummyadmin"       # User Name
vm_password    = "5^&*()tYUIOP"     # User Password

location_name           = "westeurope"              # Azure Region Location
delete_os_disk          = "true"                    # Delete Disk [ ture / false ]
delete_data_disks       = "true"                    # Delete Disk [ ture / false ]
nw_watcher_required     = "false"
enable_log_analytics    = "false"
nwwType  = "NetworkWatcherAgentWindows"
agntType = "MicrosoftMonitoringAgent"