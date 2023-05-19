#creates nic

resource "azurerm_network_interface" "az-nic" {

  name                = "nsg-demo"
  location            = azurerm_resource_group.az-rsg.location
  resource_group_name = azurerm_resource_group.az-rsg.name

  ip_configuration {
    name                          = "ipconfig-demo"
    subnet_id                     = azurerm_subnet.az-sub.id
    private_ip_address_allocation = "Dynamic"

  }
  tags = {
    enviroment = var.tag
  }

}

#creates VM
resource "azurerm_linux_virtual_machine" "az-vm" {
  name                  = "vm-demo"
  resource_group_name   = azurerm_resource_group.az-rsg.name
  location              = azurerm_resource_group.az-rsg.location
  network_interface_ids = [azurerm_network_interface.az-nic.id]
  vm_size               = "Standard_F2"
  admin_username        = var.admin_username

  #specifies image 
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"

  }

  #config disk 
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  #config profile



  tags = {
    enviroment = var.tag
  }




}