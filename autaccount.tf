resource "azurerm_automation_account" "az-aut" {
  name                = "automationaccount-demo"
  resource_group_name = azurerm_resource_group.az-rsg.name
  location            = azurerm_resource_group.az-rsg.location
  sku_name            = "Basic"

  tags = {
    enviroment = var.tag
  }

}