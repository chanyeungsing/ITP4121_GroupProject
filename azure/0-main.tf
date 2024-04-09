# Configure the Azure provider
terraform {
  required_version = ">= 1.7.5"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1" {
  name     = "rg1"
  location = "westus2"
}
