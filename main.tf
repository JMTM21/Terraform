#create resource group
resource "azurerm_resource_group" "az-rsg" {

    name = "rsg-demo"
    location = "UK South"
    tags = {

    }
  
}

resource "azurerm_network_security_group" "az-nsg" {

    name = "nsg-demo"
    location = azurerm_resource_group.az-rsg.location
    resource_group_name = azurerm_resource_group.az-rsg.name

    security_rule {
    }

    security_rule {
    }


  
}

resource "azurerm_virtual_network" "az-vnet" {
     
     name = "vnet-demo"
     location = azurerm_resource_group.az-rsg.location
     resource_group_name = azurerm_resource_group.az-rsg.name
     address_space  = ["10.0.0.0/16"]
     subnet  {

        
     }


  
}

resource "azurerm_network_interface" "az-nic" {
  

}

