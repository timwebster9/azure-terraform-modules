resource "azurerm_network_security_group" "jenkins_sg" {
  name                = "jenkins-sg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  security_rule {
    name                       = "ssh-sec-rule"
    priority                   = 600
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${var.myip}"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "http-sec-rule"
    priority                   = 610
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "${var.myip}"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "https-sec-rule"
    priority                   = 620
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "${var.myip}"
    destination_address_prefix = "*"
  }
}