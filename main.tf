#create resource group
resource "azurerm_resource_group" "az-rsg" {

    name = "rsg-demo"
    location = "UK South"
    tags = "rsg-demo"
  
}

