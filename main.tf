# Module de déploiement d'un RG et d'un network

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = [var.address_space]
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet_prefix]
}

# ... ajouter NAT Gateway et Route Table ici comme bonus

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "subnet_id" {
  value = azurerm_subnet.example.id
}
