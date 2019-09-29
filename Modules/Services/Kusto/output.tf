output "cluster_id" {
  value = "${azurerm_kusto_cluster.generic_data_exporer.id}"
}

output "cluster_uri" {
  value = "${azurerm_kusto_cluster.generic_data_exporer.uri}"
}

output "cluster_di_uri" {
  value = "${azurerm_kusto_cluster.generic_data_exporer.data_ingestion_uri}"
}

output "clusted_db_size_bytes" {
  value = "${azurerm_kusto_database.generic_data_exporer_database.size}"
}