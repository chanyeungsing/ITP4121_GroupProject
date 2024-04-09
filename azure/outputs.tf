/*

output "resource_group_name" {
  description = "Azure resource group name"
  value       = azurerm_resource_group.rg1.name
}

output "kubernetes_cluster_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks1.name
}

output "subnet1_id" {
  description = "subnet1 id"
  value = values(azurerm_virtual_network.vpc1.subnet)[0].id
}

output "subnet2_id" {
  description = "subnet1 id"
  value = values(azurerm_virtual_network.vpc1.subnet)[1].id
}

*/