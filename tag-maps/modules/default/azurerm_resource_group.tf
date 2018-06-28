resource "azurerm_resource_group" "aks_rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"

  tags = "${merge(var.common_tags,
    map("lastUpdated", "${timestamp()}")
    )}"
}