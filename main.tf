resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "main-vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  cluster_name        = var.aks_cluster_name
  node_count          = var.node_count
  vnet_name           = azurerm_virtual_network.main-vnet.name
  subnet_name         = azurerm_subnet.main.name
  subnet_id           = azurerm_subnet.main.id
  aks_version         = var.aks_version
  dns_prefix          = var.aks_dns_prefix
  node_size           = var.aks_node_size
  nodepool_name       = "testnodepool"
  autoscaling_enabled = var.aks_autoscaling_enabled
  min_count           = var.aks_min_count
  max_count           = var.aks_max_count
  admin_username      = "azureuser"
  ssh_public_key      = var.ssh_public_key
  max_pods            = var.aks_max_pods
  osdisk_size         = var.aks_osdisk_size
}

