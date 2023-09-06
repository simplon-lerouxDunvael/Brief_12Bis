# Brief_12Bis

Repo github contenant le module Terraform avec les ressources suivantes :

=> main.tf :

* Groupe de ressources
* Réseau virtuel
* Sous-réseaux : publique (x2) et privé
* Passerelle NAT + table de routage
* Cluster AKS

=> variables.tf : description des variables et de leur type + valeurs par défaut

=> output.tf : sorties des ressources (id, nom...)