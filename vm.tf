#creates nic

resource "azurerm_network_interface" "az-nic" {

  name                = "nsg-demo"
  location            = azurerm_resource_group.az-rsg.location
  resource_group_name = azurerm_resource_group.az-rsg.name

  ip_configuration {
    name                          = "ipconfig-demo"
    subnet_id                     = azurerm_virtual_network.az-vnet.subnet[0].id
    private_ip_address_allocation = "Dynamic"

  }
  tags = {
    enviroment = "demo"
  }

}

#creates VM
resource "azurerm_virtual_machine" "az-vm" {
  name                  = "vm-demo"
  resource_group_name   = azurerm_resource_group.az-rsg.name
  location              = azurerm_resource_group.az-rsg.location
  network_interface_ids = [azurerm_network_interface.az-nic.id]
  vm_size               = "Standard_DS1_v2"

  tags = {
    enviroment = "demo"
  }


}