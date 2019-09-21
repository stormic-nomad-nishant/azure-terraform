output "vpc-id" {
  value = "${module.linkedin-vpc.vpc-id}"
}

output "pub-nic-id" {
  value = "${module.linkedin-vpc.azure-public-nic-ids}"
}

output "private-nic-id" {
  value = "${module.linkedin-vpc.azure-private-nic-ids}"
}

output "public-subnet-a-id" {
  value = "${module.linkedin-vpc.public-subnet-a-id}"
}

output "public-subnet-b-id" {
  value = "${module.linkedin-vpc.private-subnet-b-id}"
}

output "private-subnet-a-id" {
  value = "${module.linkedin-vpc.private-subnet-a-id}"
}

output "private-subnet-b-id" {
  value = "${module.linkedin-vpc.private-subnet-b-id}"
}