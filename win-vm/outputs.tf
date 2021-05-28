output "virtual_machine_name" {
  description = "VM Names"
  value       = "${azurerm_virtual_machine.vm.*.name}"
}

output "network_interface_private_ip" {
  description = "Private IP Addresses of the VM Nics"
  value       = "${azurerm_network_interface.private_nic.*.private_ip_address}"
}