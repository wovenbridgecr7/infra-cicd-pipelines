resource "azurerm_virtual_network" "my-test-prod-vnet" {
 name = var.vnet_name
 resource_group_name = azurerm_resource_group.my-test-prod-rg-01.name
 location = azurerm_resource_group.my-test-prod-rg-01.location
 address_space = [ "172.168.0.0/16" ]
 }

 resource "azurerm_subnet" "my-test-prod-vnet-snet-01" {
   
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.my-test-prod-rg-01.name
    virtual_network_name = azurerm_virtual_network.my-test-prod-vnet.name
    address_prefixes = [ "172.168.1.0/24" ]
 }

 resource "azurerm_public_ip" "my-test-ip" {

    name = "tester-ip"
    location = azurerm_resource_group.my-test-prod-rg-01.location
    resource_group_name = azurerm_resource_group.my-test-prod-rg-01.name
    allocation_method = "Static"
   
 }

 resource "azurerm_network_interface" "my-test-interf" {
   
   name = var.interf_name
   resource_group_name = azurerm_resource_group.my-test-prod-rg-01.name
   location = azurerm_resource_group.my-test-prod-rg-01.location
   
   ip_configuration {
     name = "internal"
     subnet_id = azurerm_subnet.my-test-prod-vnet-snet-01.id
     private_ip_address_allocation = "Dynamic"
     #private_ip_address = "172.168.1.2"
     public_ip_address_id = azurerm_public_ip.my-test-ip.id
     
   } 
   
   }

 resource "azurerm_network_security_group" "my-test-sg" {
   
    name = var.sg_name
    resource_group_name = azurerm_resource_group.my-test-prod-rg-01.name
    location = azurerm_resource_group.my-test-prod-rg-01.location
    
 }

  resource "azurerm_network_security_rule" "my-test-sgrule" {
        name                       = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        resource_group_name = azurerm_resource_group.my-test-prod-rg-01.name
        network_security_group_name = azurerm_network_security_group.my-test-sg.name
  }

  resource "azurerm_network_security_rule" "my-test-sgrule23" {
        name                       = "test456"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        resource_group_name = azurerm_resource_group.my-test-prod-rg-01.name
        network_security_group_name = azurerm_network_security_group.my-test-sg.name
  }

  resource "azurerm_network_interface_security_group_association" "associate_networknsg" {
  network_interface_id      = azurerm_network_interface.my-test-interf.id
  network_security_group_id = azurerm_network_security_group.my-test-sg.id
}