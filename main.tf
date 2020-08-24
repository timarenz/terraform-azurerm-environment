locals {
  common_tags = {
    environment = var.environment_name
    owner       = var.owner_name
    ttl         = var.ttl
  }
}

data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "main" {
  name     = var.name
  location = var.region

  tags = local.common_tags
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.name}-virtualnetwork"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = [var.cidr_block]

  tags = local.common_tags
}

resource "azurerm_subnet" "main" {
  count                = length(var.subnets)
  name                 = "${var.name}-${lookup(var.subnets[count.index], "name")}"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [lookup(var.subnets[count.index], "prefix")]
}

# soon™
# resource "azurerm_subnet" "example" {
#   for_each = var.subnets

#   name                 = "${var.environment_name}-${each.value.name}"
#   resource_group_name  = "${azurerm_resource_group.main.name}"
#   virtual_network_name = "${azurerm_virtual_network.main.name}"
#   address_prefix       = each.value.prefix
# }
