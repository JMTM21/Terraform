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
    enviroment = var.tag
  }

}

#creates VM
resource "azurerm_virtual_machine" "az-vm" {
  name                  = "vm-demo"
  resource_group_name   = azurerm_resource_group.az-rsg.name
  location              = azurerm_resource_group.az-rsg.location
  network_interface_ids = [azurerm_network_interface.az-nic.id]
  vm_size               = "Standard_DS1_v2"

#specifies image 
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"

  }

#config disk 
  storage_os_disk {
    name              = "osdisk-demo"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

  }

  #config profile

  os_profile {
    computer_name  = "vmserver-demo"
    admin_username = var.admin_username
    admin_password = var.admin_password

  }

  os_profile_linux_config {

    disable_password_authentication = false

  }


  tags = {
    enviroment = var.tag
  }




}