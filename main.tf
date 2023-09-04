# Module de déploiement d'un RG et d'un network

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name[rg1]
  location = local.location[france]
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name[vnet1]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = local.address_space["vnet1add"]
}

resource "azurerm_subnet" "subnet" {
  name                 = local.subnet_name[sbnt1]
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = local.subnet_prefix["sbnt-pref2"] # pour mettre plusieurs clés de variables : [local.subnet_prefix["sbnt-pref2"], ["autre clé"]]
}

# ... ajouter NAT Gateway et Route Table ici comme bonus

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
