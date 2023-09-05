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
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
    vnet_subnet_id = azurerm_subnet.subnet1.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1_prefix
}

# BONUS

# Créer une NAT Gateway
resource "azurerm_nat_gateway" "gateway" {
  name                    = var.gateway_name
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  public_ip_address_ids   = [azurerm_public_ip.pubIP_gateway.id]
}

# Créer une IP publique pour la NAT Gateway
resource "azurerm_public_ip" "pubIP_gateway" {
  name                = var.pubIP_gateway_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = var.pubIP_allocation
  sku                 = var.pubIP_sku
}

# Créer une Route Table
resource "azurerm_route_table" "routeTab" {
  name                = var.routeTab_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

# Attacher la Route Table au Subnet
resource "azurerm_subnet_route_table_association" "route-association" {
  subnet_id      = azurerm_subnet.subnet1.id
  route_table_id = azurerm_route_table.routeTab
}

# Créer un sous-réseau privé
resource "azurerm_subnet" "priv_subnet" {
  name                 = var.priv_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.priv_sbnt_add_pref
  nat_gateway_id       = azurerm_nat_gateway.gateway.id
}

# Créer un sous-réseau public
resource "azurerm_subnet" "pub_subnet" {
  name                 = var.pub_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.pub_sbnt_add_pref
}

/* # Outputs

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.AKS.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.AKS.kube_config_raw
}

output "priv_subnet_id" {
  value = azurerm_subnet.priv_subnet.id
}

output "pub_subnet_id" {
  value = azurerm_subnet.pub_subnet.id
} */
