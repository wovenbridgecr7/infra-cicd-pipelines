resource "azurerm_resource_group" "my-test-prod-rg-01" {
    name = var.rg_name
    location = "West Europe"
}