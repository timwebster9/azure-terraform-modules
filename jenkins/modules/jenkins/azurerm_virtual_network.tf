resource "azurerm_virtual_network" "jenkins-vnet" {
  name                = "${var.vnet_name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = ["${var.vnet_cidr}"]
  location            = "${var.location}"
}