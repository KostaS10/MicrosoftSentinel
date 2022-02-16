resource "azurerm_resource_group" "tfsentinel" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "tflaw" {
  name                = var.sentinel_law_name
  location            = azurerm_resource_group.tfsentinel.location
  resource_group_name = azurerm_resource_group.tfsentinel.name
  sku                 = "PerGB2018"
  retention_in_days   = var.sentinel_law_retention
}