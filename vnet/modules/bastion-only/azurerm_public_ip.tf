resource "azurerm_public_ip" "bastion_ip" {
  name                          = "bastion-pub-ip"
  location                      = "${var.location}"
  resource_group_name           = "${data.azurerm_resource_group.rg.name}"
  public_ip_address_allocation  = "dynamic"
  domain_name_label             = "${data.azurerm_resource_group.rg.name}-bastion"
}