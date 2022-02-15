resource "azurerm_resource_group" "tfsentinel" {
  name     = "tfsentinel"
  location = "westeurope"
}

resource "azurerm_log_analytics_workspace" "tflaw" {
  name                = "tfsentinel-law"
  location            = azurerm_resource_group.tfsentinel.location
  resource_group_name = azurerm_resource_group.tfsentinel.name
  sku                 = "PerGB2018"
  retention_in_days   = 90
}