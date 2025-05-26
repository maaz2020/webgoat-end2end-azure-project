output "vm_names" {
  value = [for vm in azurerm_linux_virtual_machine.vm : vm.name]
}

output "vm_ips" {
  value = {
    for name, vm in azurerm_linux_virtual_machine.vm :
    name => vm.public_ip_address
  }
}
