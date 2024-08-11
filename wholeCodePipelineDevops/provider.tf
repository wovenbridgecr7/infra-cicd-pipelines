terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=1.0.0"
    }
  }
/*
  backend "azurerm" {
    resource_group_name  = "my-tes-rg-tf-state"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "testsafortfstatestorewov"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "vm.prod.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
*/


}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  #skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  skip_provider_registration = true
  client_id       = "71d9353e-acf1-45ed-8d7d-0fdfdc47013f"
  client_secret   = var.client_secret
  tenant_id       = "032a3736-9353-4090-8308-1dc987bf861d"
  subscription_id = "036beaef-6758-40a6-94b8-51cb5486d7fc"
}



provider "random" {
  
}