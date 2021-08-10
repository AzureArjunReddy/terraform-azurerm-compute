# terraform-azurerm-compute

## Deploys 1+ Virtual Machines to your provided VNet/Subnet

This Terraform deploys Virtual Machines in Azure with the following characteristics:

- Ability to specify Azure Market place image, by specifying `var.os_mk_img_*`. Retrive the list of [latest marketplace image Using Azure Cli](https://docs.microsoft.com/cli/azure/vm/image?view=azure-cli-latest) 
- All VMs use [managed disks](https://azure.microsoft.com/services/managed-disks/) 
- VM nics attached to a single virtual network subnet of your choice
- Control the number of Public IP addresses assigned to VMs via `var.public_ip_required=true`. Create and attach one Public IP per VM up to the number of VMs or create NO public IPs via setting `var.public_ip_required=false`
- Control VM SKU `var.vm_sku_type`.
- Boot diagnostics is enabled.
- Additional tags are added to VM
- OS disk is deleted upon deletion of the VM
- Add one managed data disk or none
- Public IP addresses (one for each VM)
- Public IP Addresses allocation method is Static and SKU is Standard
- Using port 3389 for RDP access using the password as shown
- `var.nb_of_ddisk` Number of the data disks attached to each virtual machine

**> Note: Pre requisites to create a VM. 1) VM resourceGroup 2) Storage Account 3) Virtual Network 4) Subnet 5) Network Security Group (NSG)**

## Usage in Terraform 1.0.4
```hcl
provider "azurerm" {
  features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "tfbackendsa01"
    container_name       = "terraformkeystore"
    key                  = "windows-vm-key"
  }
}
//------------------------------------------------------------
node_count                = "1"         # No Of VM's to create
vm_name                   = "VMNAME"    # VM Name
app                       = "WORKLOAD"  # Workload Name
zones                     = [1,2,3]     # [1] / [1,2] / [1,2,3]
location_name             = "westeurope"  # Azure Region Location
public_ip_required        = "false"
static_ip_required        = "true"
disk_encryption_required  = "false"
data_disk_required        = "false"
nb_of_ddisk               = "0"
ddisk_mount_required      = "false"
enable_accelerated_nw     = "false"
ip_type                   = "Dynamic"   # [Dynamic / Static]
ip_addr                   = ""          # [In case of ip_type = Static Provide IP Address ]
os_cs_img_required        = "false"     # To use SIG Image or False for Marketplace Image
win_license_type          = ""	        # [Blank Value("") for Not Using Hybrid Benefit / Windows_Server for Win 2016/2019 DC / Windows_Client for Win 10]

vm_sku_type = "Standard_B1ms" # VM SKU Model which is available in WEU region
osdisk_type = "Standard_LRS"  # OS Disk-Type Premium_LRS / Standard_LRS
osdisk_size = ""              # OS Disk-Size in GB [32, 128, 256, 1024]
mddisk_type = ""              # Data Disk-Type Premium_LRS / Standard_LRS
mddisk_size = ""              # Data Disk-Size in GB [8, 16, 32, 64, 128, 256, 512, 1024]

vm_rg_name    = "abc-vm-rg" # VM RG Name

nw_rg_name  = "network-rg"       # N/W resourceGroup Name
vnet_name   = "tungamalli-vnet"  # N/W VNet Name
subnet_name = "Subnet01"  # Sub Net Name

keyvault_rg_name = "keyvault-rg"      # Key Vault resourceGroup
keyvault_name    = "diskencry-kv"     # Key Vault Name
key_name         = "DiskEncKey"       # Key Name

diag_storage_name = "https://storageaccount.blob.core.windows.net/" # For Boot Diagnostics

os_cs_img_id = ""     # Azure Shared Image Gallery
os_mk_img_publisher   = "MicrosoftWindowsServer"
os_mk_img_offer       = "WindowsServer"
os_mk_img_sku         = "2019-Datacenter"
os_mk_img_version     = "latest"

tags = {  
  "CostCenter"    = "Azure"
  "Dept"          = "Community"
  "Maintainer"    = "Tunga Malli"
  "Power Off"     = "Y"
}

vm_username    = "dummyadmin"       # User Name
vm_password    = "5^&*()tYUIOP"     # User Password

delete_os_disk          = "true"                    # Delete Disk [ ture / false ]
delete_data_disks       = "true"                    # Delete Disk [ ture / false ]
nw_watcher_required     = "false"
enable_log_analytics    = "false"
nwwType  = "NetworkWatcherAgentWindows"
agntType = "MicrosoftMonitoringAgent"
//------------------------------------------------------------
output "virtual_machine_name" {
  description = "VM Names"
  value       = "${azurerm_virtual_machine.vm.*.name}"
}
output "network_interface_private_ip" {
  description = "Private IP Addresses of the VM Nics"
  value       = "${azurerm_network_interface.private_nic.*.private_ip_address}"
}
```
Provisions an a Windows 2019 Datacenter Server VM.

#### Quick Run

Using Azure CLI:

```bash
git clone https://github.com/AzureArjunReddy/terraform-azurerm-compute.git
cd terraform-azurerm-compute/win-vm
terraform init
terraform validate
terraform plan
terraform apply
```

## Author

created by [Tunga Mallikarjuna Reddy](https://github.com/AzureArjunReddy)

## License

[MIT](LICENSE)
