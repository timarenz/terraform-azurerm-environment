output "rg_location" {
  value = azurerm_resource_group.main.location
}

output "rg_id" {
  value = azurerm_resource_group.main.id
}

output "rg_name" {
  value = azurerm_resource_group.main.name
}

output "vnet_location" {
  value = azurerm_virtual_network.main.location
}

output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "subnet_ids" {
  value = azurerm_subnet.main[*].id
}

output "subnet_names" {
  value = azurerm_subnet.main[*].name
}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}
