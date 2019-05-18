module "linkedin-storage-backend" {
  source = "../../Modules/Services/Storage_accounts"
  resource-grp-name = "linkedin-group"
  storage-account-name = "linkedin-storage"
  azure-dc = "westus"
  storage-account-tier = "Standard"
  storage-replication-type = "LRS"
  storage-container-name = "Linkedin-devs"
  storage-container-access = "private"
  blob-name = "linkedin-dev-unicorns"
}