output "load-balancer-publicip" {
  value = "${module.lb-public-ip.public-ip}"
}

output "load-balancer-id" {
  value = "${module.linkedin-loadbalancer.lb-id}"
}

output "load-balancer-backendpool-id" {
  value = "${module.linkedin-loadbalancer.lb-backend-pool-id}"
}