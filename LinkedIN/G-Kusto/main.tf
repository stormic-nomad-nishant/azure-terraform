module "linkedin-data-explorer" {
  source = "../../Modules/Services/Kusto"
  cluster_name = "logcluster"
  azure-dc = "westus"
  resource-grp-name = "linkedin-group"
}