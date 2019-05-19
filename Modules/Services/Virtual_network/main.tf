resource "azurerm_network_security_group" "generic-public-sec-grp" {
  location = "${var.azure-dc}"
  name = "${var.network-secgrp-name}"
  resource_group_name = "${var.resource-grp-name}"
}
resource "azurerm_network_security_rule" "generic-public-rules" {
  name                        = "test123"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "22"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.resource-grp-name}"
  network_security_group_name = "${azurerm_network_security_group.generic-public-sec-grp.name}"
}

resource "azurerm_network_ddos_protection_plan" "generic-ddos-prc" {
  location = "${var.azure-dc}"
  name = "${var.ddos-proc-name}"
  resource_group_name = "${var.resource-grp-name}"
}

resource "azurerm_virtual_network" "generic-virtual-cloud" {
  address_space = "${var.vpc-cidr}"
  location = "${var.azure-dc}"
  name = "${var.vpc-name}"
  resource_group_name = "${var.resource-grp-name}"
  ddos_protection_plan {
    enable = true
    id = "${azurerm_network_ddos_protection_plan.generic-ddos-prc.id}"
  }
  subnet {
    address_prefix = "${var.subnet1-cidr}"
    name = "${var.subnet1-name}"
  }

  subnet {
    address_prefix = "${var.subnet2-cidr}"
    name = "${var.subnet2-name}"
  }

  subnet {
    address_prefix = "${var.subnet3-cidr}"
    name = "${var.subnet3-name}"
    security_group = "${azurerm_network_security_group.generic-public-sec-grp.id}"
  }

  subnet {
    address_prefix = "${var.subnet4-cidr}"
    name = "${var.subnet4-name}"
    security_group = "${azurerm_network_security_group.generic-public-sec-grp.id}"
  }

  tags = {
    environment = "${var.env-type}"
  }
}