resource "azurerm_virtual_machine" "my-test-vm1" {

    name = "test-vm"
    resource_group_name = azurerm_resource_group.my-test-prod-rg-01.name
    location = azurerm_resource_group.my-test-prod-rg-01.location
    
    network_interface_ids = [ azurerm_network_interface.my-test-interf.id ]

    primary_network_interface_id = azurerm_network_interface.my-test-interf.id
     delete_data_disks_on_termination = true
     delete_os_disk_on_termination = true

      vm_size = "Standard_DS1_v2"

      storage_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
  }

    storage_os_disk {
    name              = "myosdiskeditedtobenew"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  
}