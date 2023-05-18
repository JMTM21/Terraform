#create resource group
resource "azurerm_resource_group" "az-rsg" {

    name = "rsg-demo"
    location = "UK South"
    tags = {
        enviroment = "demo"
    }
  
}

#creates network security group
resource "azurerm_network_security_group" "az-nsg" {

    name = "nsg-demo"
    location = azurerm_resource_group.az-rsg.location
    resource_group_name = azurerm_resource_group.az-rsg.name

#rules below allowing rdp from 1 IP, deny all else
    security_rule {
        name = "allow rdp"
        priority = 100
        direction = "inbound"
        access = "allow"
        protocol = "RDP"
        source_port_range = "3389"
        destination_port_range = "*"
        source_address_prefix = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name = "deny all"
        priority = 101
        direction = "inbound"
        access = "deny"

    }

    tags = {
        enviroment = "demo"
    }

  
}

#creates vnet
resource "azurerm_virtual_network" "az-vnet" {
     
     name = "vnet-demo"
     location = azurerm_resource_group.az-rsg.location
     resource_group_name = azurerm_resource_group.az-rsg.name
     address_space  = ["10.0.0.0/16"]

     subnet  {

        
     }
     tags = {
        enviroment = "demo"
    }


  
}

#creates nic

resource "azurerm_network_interface" "az-nic" {

    name = "nsg-demo"
    location = azurerm_resource_group.az-rsg.location
    resource_group_name = azurerm_resource_group.az-rsg.name
  
    tags = {
        enviroment = "demo"
    }

}

