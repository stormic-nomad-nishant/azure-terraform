resource "azurerm_kusto_cluster" "generic_data_exporer" {
  name                = "${var.cluster_name}"
  location            = "${var.azure-dc}"
  resource_group_name = "${var.resource-grp-name}"

  sku {
    name     = "Standard_D11_v2"
    capacity = 2
  }

  tags = {
    Environment = "Production"
  }
}


resource "azurerm_kusto_database" "generic_data_exporer_database" {
  name                = "${var.cluster_name}-database"
  resource_group_name = "${var.resource-grp-name}"
  location            = "${var.azure-dc}"
  cluster_name        = azurerm_kusto_cluster.generic_data_exporer.name

  hot_cache_period   = "P7D"
  soft_delete_period = "P31D"
}