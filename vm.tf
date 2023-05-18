#creates VM
resource "azurerm_virtual_machine" "az-vm" {
 name = "vm-demo"
 resource_group_name = azurerm_resource_group.az-rsg.name
 location = azurerm_resource_group.az-rsg.location
 network_interface_ids = ""
 vm_size = ""


  
}