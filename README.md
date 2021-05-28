# terraform-azurerm-compute

[![Build Status](https://travis-ci.org/Azure/terraform-azurerm-compute.svg?branch=master)](https://travis-ci.org/Azure/terraform-azurerm-compute)

## Deploys 1+ Virtual Machines to your provided VNet/Subnet

This Terraform module deploys Virtual Machines in Azure with the following characteristics:

- Ability to specify a simple string to using `var.os_mk_img_*`. To get the [latest marketplace image Using Azure Cli](https://docs.microsoft.com/cli/azure/vm/image?view=azure-cli-latest) 
- All VMs use [managed disks](https://azure.microsoft.com/services/managed-disks/)
- Network Security Group (NSG)
- VM nics attached to a single virtual network subnet of your choice
- Control the number of Public IP addresses assigned to VMs via `var.public_ip_required=true`. Create and attach one Public IP per VM up to the number of VMs or create NO public IPs via setting `var.public_ip_required=false`
- Control VM SKU `var.vm_sku_type`.

> Note: Terraform module registry is incorrect in the number of required parameters since it only deems required based on variables with non-existent values.  The actual minimum required variables depends on the configuration and is specified below in the usage.

## Usage in Terraform 0.15
```hcl
provider "azurerm" {
  features {}
}


output "windows_vm_public_name" {
  value = module.windowsservers.public_ip_dns_name
}
```
## Simple Usage in Terraform 0.12

This contains the bare minimum options to be configured for the VM to be provisioned.  The entire code block provisions a Windows and a Linux VM, but feel free to delete one or the other and corresponding outputs. The outputs are also not necessary to provision, but included to make it convenient to know the address to connect to the VMs after provisioning completes.

Provisions an Ubuntu Server 16.04-LTS VM and a Windows 2016 Datacenter Server VM using `vm_os_simple` to a new VNet and opens up ports 22 for SSH and 3389 for RDP access via the attached public IP to each VM.  All resources are provisioned into the default resource group called `terraform-compute`.  The Ubuntu Server will use the ssh key found in the default location `~/.ssh/id_rsa.pub`.


## Advanced Usage

The following example illustrates some of the configuration options available to deploy a virtual machine. Feel free to remove the Linux or Windows modules and corresponding outputs.

More specifically this provisions:

1 - New vnet for all vms

2 - Ubuntu 18.04 Server VMs using `vm_os_publisher`, `vm_os_offer` and `vm_os_sku` which is configured with:

- No public IP assigned, so access can only happen through another machine on the vnet.
- Opens up port 22 for SSH access with the default ~/.ssh/id_rsa.pub key
- Boot diagnostics is enabled.
- Additional tags are added to the resource group.
- OS disk is deleted upon deletion of the VM
- Add one managed data disk or none

2 - Windows Server 2012 R2 VMs using `vm_os_publisher`, `vm_os_offer` and `vm_os_sku` which is configured with:

- Public IP addresses (one for each VM)
- Public IP Addresses allocation method is Static and SKU is Standard
- Opens up port 3389 for RDP access using the password as shown

3 - New features are supported in v3.0.0:

- "nb_data_disk" Number of the data disks attached to each virtual machine

```hcl
provider "azurerm" {
  features {}
}


output "windows_vm_private_ips" {
  value = module.windowsservers.network_interface_private_ip
}

```

#### Quick Run

Simple script to quickly set up module development environment:

This runs the full tests:

```sh
$ docker run --rm azure-compute /bin/bash -c "bundle install && rake full"
```

## Authors

Originally created by [Tunga Malli](http://github.com/tungamalli-azure)

## License

[MIT](LICENSE)
