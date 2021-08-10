provider "azurerm" {
  features {}
  subscription_id = "85f8c4cc-18b8-446c-8ea9-5fc173930503"
}

terraform {
    required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  /*backend "azurerm" {
    //subscription_id      = "12345678-1234-1234-1234-12345678"
    resource_group_name  = "terrafrom-rg"
    storage_account_name = "vmtfbackend01"
    container_name       = "abrtfkeystore"
    key                  = "windows-vm-key"
  }*/
}
