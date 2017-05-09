# create a vnet
# (VPC for those who speak AWS)
resource "azurerm_virtual_network" "network" {
  name                = "${var.stack_name}_network"
  address_space       = ["${var.vnet_cidr}"]
  location            = "${var.azure_location}"
  resource_group_name = "${azurerm_resource_group.res_group.name}"

  tags {
    environment = "${var.environment}"
    stack_name  = "${var.stack_name}"
  }
}

# for each record in var.subnets
# create a subnet
# calculate the cidr from the base vnet subnet
resource "azurerm_subnet" "subnets" {
  count = "${length(var.subnets)}"

  name                 = "${element(var.subnets, count.index)}"
  resource_group_name  = "${azurerm_resource_group.res_group.name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix       = "${cidrsubnet(var.vnet_cidr, 8, count.index)}"
}
