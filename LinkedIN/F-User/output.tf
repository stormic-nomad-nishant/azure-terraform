output "User-id" {
  value = ["${module.linkedin-ad-users.*.user_emails}"]
}

output "User-mail" {
  value = ["${module.linkedin-ad-users.*.user_id}"]
}