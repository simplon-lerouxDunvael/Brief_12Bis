# Variables pour le déploiement du module network

variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type = string
  default = "db12-rg"
}

variable "location" {
  description = "Localisation des ressources"
  type = string
  default = "francecentral"
}

variable "vnet_name" {
  description = "Nom du Vnet"
  type = string
  default = "db12-vnet"
}

variable "address_space" {
  description = "Adresse IP"
  type = string
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "¨Nom du sous-réseau"
  type = string
  default = "db12-sbnt"
}

variable "subnet_prefix" {
  description = "Masque de sous-réseau"
  type = string
  default = "10.0.0.0/16"
}
