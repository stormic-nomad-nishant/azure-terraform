module "linkedin-vm-scale-set" {
  source = "../../Modules/Services/Virtual_machine_scaleset"
  scale-set-name = "linkedin-dummy-scaleset"
  azure-dc = "westus"
  resource-grp-name = "linkedin-group"
  subnet_id = "${data.terraform_remote_state.virtual-network.outputs.public-subnet-a-id}"
  backend-address-pool-id = "${data.terraform_remote_state.loadbalancer.outputs.load-balancer-backendpool-id}"
  tags = { environment = "staging" }
}