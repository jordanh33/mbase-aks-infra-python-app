variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "test-rg"
}

variable "vnet_name" {
  default = "test-vnet"
}

variable "subnet_name" {
  default = "test-subnet"
}

variable "aks_cluster_name" {
  default = "test-aks-cluster"
}

variable "node_count" {
  default = 1
}
variable "aks_version" {
  default = "1.21.2"
}
variable "aks_dns_prefix" {
  default = "aks-test"
  
}
variable "aks_node_size" {
  default = "Standard_DS2_v2"
}
variable "aks_autoscaling_enabled" {
  default = false
}
variable "aks_min_count" {
  default = 1
}
variable "aks_max_count" {
  default = 3
}
variable "aks_nodepool_name" {
  default = "testnodepool"
}
variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3..."
}
variable "aks_max_pods" {
  default = 30
}
variable "aks_osdisk_size" {
  default = 30
}

