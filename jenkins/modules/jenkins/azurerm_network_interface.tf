resource "azurerm_network_interface" "jenkins-nic" {
  name                          = "jenkins-nic"
  location                      = "${var.location}"
  resource_group_name           = "${azurerm_resource_group.rg.name}"

  ip_configuration {
    name                          = "jenkins_ip"
    subnet_id                     = "${azurerm_subnet.jenkins_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.jenkins_ip.id}"
  }
}