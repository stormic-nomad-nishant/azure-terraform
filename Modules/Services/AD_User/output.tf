output "user_emails" {
  value = ["${azuread_user.generic_user.*.mail}"]
}

output "user_id" {
  value = ["${azuread_user.generic_user.*.id}"]
}