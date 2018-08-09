resource "azurerm_subnet" "jenkins_subnet" {
  name                      = "${var.jenkins_subnet_name}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  virtual_network_name      = "${azurerm_virtual_network.jenkins-vnet.name}"
  address_prefix            = "${var.jenkins_subnet_cidr}"
  network_security_group_id = "${azurerm_network_security_group.jenkins_sg.id}"
}
