# Variables pour le déploiement du module avec les ressources et le cluster AKS

# Variable localisation et RG

variable resource_group_name {
  description = "Nom du RG"
  type = string
  default = "db12-rg"
}

variable location {
  description = "Localisation des ressources"
  type = string
  default = "francecentral"
}

# Variables ressources

variable vnet_name {
  description = "Nom du Vnet"
  type = string
  default = "db12-vnet"
}

variable address_space {
  description = "CIDR"
  type = string
  default = "10.0.1.0/24"
}

variable subnet1_name {
  description = "Nom du sous-réseau 1"
  type = string
  default = "db12-sbnt"
}

variable subnet1_prefix {  
  description = "Plage d'adresses IP pour le sous-réseau 1"
  type = string
  default = "10.0.0.0/16"
}

variable gateway_name {  
  description = "Nom de la passerelle"
  type = string
  default = "db12_gateway"
}

variable pubIP_gateway_name {  
  description = "Nom de l'IP publique de la gateway"
  type = string
  default = "db12_gateway_pubIP"
}

variable pubIP_allocation {  
  description = "Méthode d'allocation pour l'IP publique de la gateway"
  type = string
  default = "Static"
}

variable pubIP_sku {  
  description = "SKU de l'IP publique de la gateway"
  type = string
  default = "Standard"
}

variable routeTab_name {  
  description = "Nom de la table de routage"
  type = string
  default = "db12_routeTab"
}

variable priv_subnet_name {  
  description = "Nom du sous-réseau privé"
  type = string
  default = "db12_priv_sbnt"
}

variable priv_sbnt_add_pref {  
  description = "Plage d'adresses IP pour le sous-réseau privé"
  type = string
  default = "10.0.2.0/16"
}

variable pub_subnet_name {  
  description = "Nom du sous-réseau publique"
  type = string
  default = "db12_pub_sbnt"
}

variable pub_sbnt_add_pref {  
  description = "Plage d'adresses IP pour le sous-réseau publique"
  type = string
  default = "10.0.3.0/16"
}

# Variables pour l'AKS

variable aks_name {
  description = "Nom du cluster AKS"
  type = string
  default = "db12-AKS"
}

variable node_pool_name {
  description = "Nom du node pool"
  type = string
  default = "pool-db12"
}

variable node_count {
  description = "Nombre de nodes"
  type = number
  default = 2
}

variable vm_size {
  description = "Taille de la VM"
  type = string
  default = "Standard_D2_v2"
}