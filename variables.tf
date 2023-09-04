# Variables pour le déploiement du module network

variable resource_group_name {
  description = "value"
  type = string
  rg1 = "db12-rg"
}

variable location {
  description = "value"
  type = string
  default = "francecentral"
}

variable vnet_name {
  description = "value"
  type = string
  default = "db12-vnet"
}

variable address_space {
  description = "value"
  type = string
  default = "10.0.1.0/24"
}

variable subnet_name {
  description = "value"
  type = string
  default = "db12-sbnt"
}

variable subnet_prefix {  
  description = "value"
  type = string
  default = "10.0.0.0/16"
}
