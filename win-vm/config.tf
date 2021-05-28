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
