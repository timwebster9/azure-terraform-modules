resource "azurerm_virtual_machine" "bastion-vm" {
  name                          = "bastion"
  location                      = "${var.location}"
  resource_group_name           = "${azurerm_resource_group.rg.name}"
  network_interface_ids         = ["${azurerm_network_interface.bastion-nic.id}"]
  vm_size                       = "${var.bastion_vm_size}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name                        = "bastion-osdisk"
    caching                     = "ReadWrite"
    create_option               = "FromImage"
    managed_disk_type           = "Standard_LRS"
  }

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  os_profile {
    computer_name               = "${var.bastion_hostname}"
    admin_username              = "${var.bastion_admin_username}"
    admin_password              = "${var.bastion_admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
    ssh_keys { 
        key_data = "${file("${var.ssh_public_key}")}"
        path = "/home/${var.bastion_admin_username}/.ssh/authorized_keys" }
  }
}