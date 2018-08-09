resource "azurerm_public_ip" "jenkins_ip" {
  name                          = "jenkins-pub-ip"
  location                      = "${var.location}"
  resource_group_name           = "${azurerm_resource_group.rg.name}"
  public_ip_address_allocation  = "dynamic"
  domain_name_label             = "${azurerm_resource_group.rg.name}-jenkins"
}