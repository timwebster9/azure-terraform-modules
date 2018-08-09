resource "azurerm_storage_account" "jenkinssa" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}