resource "azuread_user" "generic_user" {
  count = "${length(var.user_emailids)}"
  user_principal_name = "${element(var.user_emailids, count.index )}"
  display_name        = "${element(var.dp_name, count.index )}"
  mail_nickname       = "${element(var.user_nickname, count.index )}"
  password            = "${element(var.user_pass, count.index )}"
}