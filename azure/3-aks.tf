#aks
resource "azurerm_kubernetes_cluster" "aks1" {
  name                = "aks1"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  dns_prefix          = "ive220035674-k8s"
  #kubernetes_version  = "1.27.~"

  default_node_pool {
    name            = "default"
    node_count      = var.aksnodenumber
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  auto_scaler_profile {
    scale_down_utilization_threshold = 0.5
    max_unready_nodes = 4
    max_unready_percentage = 50
  }

  role_based_access_control_enabled = true
  private_cluster_enabled = true

}