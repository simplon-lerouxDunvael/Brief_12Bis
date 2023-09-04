# Variables pour le déploiement du module avec les ressources et le cluster AKS

variable aks_name {
  description = "Nom du cluster AKS"
  type = string
  aks = "db12-AKS"
}

variable resource_group_name {
  description = "Nom du RG"
  type = string
  rg1 = "db12-rg"
}

variable location {
  description = "Localisation des ressources"
  type = string
  default = "francecentral"
}

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

variable subnet_name {
  description = "Nom du subnet"
  type = string
  default = "db12-sbnt"
}

variable subnet_prefix {  
  description = "Plage d'adresses IP pour le sous-réseau"
  type = string
  default = "10.0.0.0/16"
}

variable node_pool_name {
  description = "Nom du node pool"
  type = string
  default = "pool-db12"
}

variable node_count {
  description = "Nombre de nodes"
  type = number
  default = "2"
}

variable vm_size {
  description = "Taille de la VM"
  type = string
  default = "Standard_D2_v2"
}

variable identity {
  description = "Identité"
  type = string
  default = "SystemAssigned"
}

variable tags {
  description = "Tag"
  type = string
  default = "dev"
}