module "lb-public-ip" {
  source = "../../Modules/Services/Public_IP"
  azure-dc = "westus"
  resource-grp-name = "linkedin-group"
}

module "linkedin-loadbalancer" {
  source = "../../Modules/Services/Load_balancer"
  azure-dc = "westus"
  resource-grp-name = "linkedin-group"
  loadbalancer-name = "linkedn-ssh-pub"
  frontend-ip-conf-name = "linkedin-frontend"
  public-ip-id = "${module.lb-public-ip.public-ip-id}"
}