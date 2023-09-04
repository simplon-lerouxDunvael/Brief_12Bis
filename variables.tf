# Variables pour le déploiement du module network
locals {

variable "resource_group_name" {
  rg1 = "db12-rg"
  rg2 = "db13-rg"
}

variable "location" {
  france = "francecentral"
  europe = "westeurope"
}

variable "vnet_name" {
  vnet1 = "db12-vnet"
  vnet2 = "db13-vnet"
}

variable "address_space" {
  vnet1add = "10.0.1.0/24"
  vnet2add = "10.0.2.0/24"
}

variable "subnet_name" {
  sbnt1 = "db12-sbnt"
  sbnt2 = "db13-sbnt"
}

variable "subnet_prefix" {
  sbnt-pref1 = "10.0.0.0/16"
  sbnt-pref2 = "10.0.0.0/16"
}

}
