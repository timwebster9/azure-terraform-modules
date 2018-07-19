resource "azurerm_subnet" "bastion_subnet" {
  name                      = "${var.bastion_subnet_name}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  address_prefix            = "${var.bastion_subnet_cidr}"
  network_security_group_id = "${azurerm_network_security_group.bastion_sg.id}"
}

resource "azurerm_subnet" "jenkins_subnet" {
  name                      = "${var.jenkins_subnet_name}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  address_prefix            = "${var.jenkins_subnet_cidr}"
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.aks_subnet_name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.aks_subnet_cidr}"
}