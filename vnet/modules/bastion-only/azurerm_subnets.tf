data "azurerm_subnet" "bastion_subnet" {
  name                      = "${var.bastion_subnet_name}"
  resource_group_name       = "${data.azurerm_resource_group.rg.name}"
  virtual_network_name      = "${data.azurerm_virtual_network.vnet.name}"
}

data "azurerm_subnet" "jenkins_subnet" {
  name                      = "${var.jenkins_subnet_name}"
  resource_group_name       = "${data.azurerm_resource_group.rg.name}"
  virtual_network_name      = "${data.azurerm_virtual_network.vnet.name}"
}

data "azurerm_subnet" "aks_subnet" {
  name                 = "${var.aks_subnet_name}"
  resource_group_name  = "${data.azurerm_resource_group.rg.name}"
  virtual_network_name = "${data.azurerm_virtual_network.vnet.name}"
}