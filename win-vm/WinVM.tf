###############################################################################
# Developed by Tunga Mallikarjuna Reddy
###############################################################################

# Generate random text for a unique Public IP name
resource "random_id" "randomId" {
    byte_length = 5
}
# Read and Load Vnet Info
data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.nw_rg_name
}
# Read and Load Subnet Info
data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.nw_rg_name
}
# Read and Load Keyvault Info
data "azurerm_key_vault" "kv" {
  count               = var.disk_encryption_required ? 1 :0
  name                = var.keyvault_name
  resource_group_name = var.keyvault_rg_name
}
# Read and Load Keyvault KeK Info
data "azurerm_key_vault_key" "key" {
  count               = var.disk_encryption_required ? 1 :0
  name                = var.key_name
  key_vault_id        = data.azurerm_key_vault.kv[0].id
}
# Create public IPs
resource "azurerm_public_ip" "public_ip" {
    name                         = "Arjun${random_id.randomId.hex}"
    location                     = var.location_name
    resource_group_name          = var.vm_rg_name
    allocation_method            = "Dynamic"

    tags = {
        environment = "MSFT Reactor"
    }
}
# Create network interface
resource "azurerm_network_interface" "private_nic" {
  name                = "${var.vm_name}-nic01"  
  location            = var.location_name
  resource_group_name = var.vm_rg_name

  ip_configuration {
    name                          = "${var.vm_name}-ip1"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"    
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  tags = {
        environment = "MSFT Reactor"
  }
}

# Create Virtual Machine with RedHat MarketPlace Image
resource "azurerm_virtual_machine" "vm" {  
  name                  = var.vm_name
  location              = var.location_name  
  resource_group_name   = var.vm_rg_name
  network_interface_ids = [azurerm_network_interface.private_nic.id]
  vm_size               = var.vm_sku_type

  storage_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2019-Datacenter"
      version   = "latest"
  }
  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.osdisk_type    
  }
  dynamic storage_data_disk {
    for_each = range(var.nbof_data_disk)
    content {
      name              = "${var.vm_name}-ddisk0${storage_data_disk.value +1}"      
      create_option     = "Empty"
      lun               = storage_data_disk.value
      disk_size_gb      = var.mddisk_size
      managed_disk_type = var.mddisk_type      
    }
  }  
  os_profile {
    computer_name  = var.vm_name
    admin_username = "winadmin"
    admin_password = "Passw0rd!123"
  }
  os_profile_windows_config {
    provision_vm_agent = true
  }
  boot_diagnostics {
      enabled     = "true"
      storage_uri = var.diag_storage_name
  }
  tags = var.tags
}
