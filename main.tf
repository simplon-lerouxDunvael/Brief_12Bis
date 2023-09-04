# Module de déploiement d'un RG et d'un network

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Déploiement du cluster AKS
resource "azurerm_kubernetes_cluster" "AKS" {
  name                = var.aks_name
  location            = module.network.location
  resource_group_name = module.network.resource_group_name

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
    vnet_subnet_id = module.network.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.tags
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefix
}

# ... ajouter NAT Gateway et Route Table ici comme bonus



# Outputs

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.AKS.kube_config_raw
}
