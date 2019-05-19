module "linkedin-vpc" {
  source = "../../Modules/Services/Virtual_network"
  vpc-cidr = ["10.0.0.0/16"]
  vpc-name = "linkedin-cloud"
  subnet1-cidr = "10.0.1.0/24"
  subnet2-cidr = "10.0.2.0/24"
  subnet3-cidr = "10.0.3.0/24"
  network-secgrp-name = "linkedin-public-firewall"
  resource-grp-name = "linkedin-group"
  azure-dc = "westus"
  ddos-proc-name = "linkedin-stdddos-proc"
  env-type = "Production"
}