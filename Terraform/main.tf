resource "azurerm_resource_group" "tfrg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "tflaw" {
  name                = var.sentinel_law_name
  location            = azurerm_resource_group.tfrg.location
  resource_group_name = azurerm_resource_group.tfrg.name
  sku                 = "PerGB2018"
  retention_in_days   = var.sentinel_law_retention
}

resource "azurerm_log_analytics_solution" "tfsentinel" {
  solution_name         = "SecurityInsights"
  location              = azurerm_resource_group.tfrg.location
  resource_group_name   = azurerm_resource_group.tfrg.name
  workspace_resource_id = azurerm_log_analytics_workspace.tflaw.id
  workspace_name        = azurerm_log_analytics_workspace.tflaw.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
}