# Variables pour le déploiement du module network
locals {

resource_group_name = {
  "rg1" = "db12-rg"
  "rg2" = "db13-rg"
}

location = {
  "france" = "francecentral"
  "europe" = "westeurope"
}

vnet_name = {
  "vnet1" = "db12-vnet"
  "vnet2" = "db13-vnet"
}

address_space = {
  "vnet1add" = "10.0.1.0/24"
  "vnet2add" = "10.0.2.0/24"
}

subnet_name = {
  "sbnt1" = "db12-sbnt"
  "sbnt2" = "db13-sbnt"
}

subnet_prefix = {
  "sbnt-pref1" = "10.0.0.0/16"
  "sbnt-pref2" = "10.0.0.0/16"
}

}
