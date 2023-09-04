# Variables pour le déploiement du module network

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_prefix" {
  type = string
}
