output "vpc-id" {
  value = "${module.linkedin-vpc.vpc-id}"
}

output "pub-nic-id" {
  value = "${module.linkedin-vpc.azure-public-nic-ids}"
}

output "private-nic-id" {
  value = "${module.linkedin-vpc.azure-private-nic-ids}"
}