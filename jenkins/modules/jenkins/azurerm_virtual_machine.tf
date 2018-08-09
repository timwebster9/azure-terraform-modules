resource "azurerm_virtual_machine" "jenkins-vm" {
  name                          = "jenkins"
  location                      = "${var.location}"
  resource_group_name           = "${azurerm_resource_group.rg.name}"
  network_interface_ids         = ["${azurerm_network_interface.jenkins-nic.id}"]
  vm_size                       = "${var.jenkins_vm_size}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name                        = "jenkins-osdisk"
    caching                     = "ReadWrite"
    create_option               = "FromImage"
    managed_disk_type           = "Standard_LRS"
  }

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  os_profile {
    computer_name               = "${var.jenkins_hostname}"
    admin_username              = "${var.admin_username}"
    custom_data                 = "${file("${path.module}/files/custom-data.sh")}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys { 
        key_data = "${file("${var.ssh_public_key}")}"
        path = "/home/${var.admin_username}/.ssh/authorized_keys" }
  }
}