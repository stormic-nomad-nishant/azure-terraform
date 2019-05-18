module "linkedin-strg-backend" {
  source = "../../Modules/Services/Storage_accounts"
  resource-grp-name = "linkedin-group"
  storage-account-name = "linkedinstg"
  azure-dc = "westus"
  storage-account-tier = "Standard"
  storage-replication-type = "LRS"
  storage-container-name = "linkedin-devs"
  storage-container-access = "private"
  blob-name = "linkedin-dev-unicorns"
}