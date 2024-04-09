resource "azurerm_cosmosdb_postgresql_cluster" "db1" {
  name                            = "db1"
  resource_group_name             = azurerm_resource_group.rg1.name
  location                        = azurerm_resource_group.rg1.location
  administrator_login_password    = var.DbAdminPw
  coordinator_storage_quota_in_mb = 131072
  coordinator_vcore_count         = 2
  node_count                      = 0
}
