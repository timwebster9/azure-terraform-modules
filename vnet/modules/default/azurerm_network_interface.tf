resource "azurerm_network_interface" "bastion-nic" {
  name                          = "bastion-nic"
  location                      = "${var.location}"
  resource_group_name           = "${azurerm_resource_group.rg.name}"

  ip_configuration {
    name                          = "bastion_ip"
    subnet_id                     = "${azurerm_subnet.bastion_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.bastion_ip.id}"
  }
}