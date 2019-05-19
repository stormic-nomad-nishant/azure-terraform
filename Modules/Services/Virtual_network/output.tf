output "vpc-id" {
  value = "${azurerm_virtual_network.generic-virtual-cloud.id}"
}

output "vpc-cidr" {
  value = "${azurerm_virtual_network.generic-virtual-cloud.address_space}"
}