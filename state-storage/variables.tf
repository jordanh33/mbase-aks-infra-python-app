variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_name" {
  description = "The name of the blob container"
  type        = string
}

variable "access_tier" {
  description = "The access tier of the storage account"
  type        = string
  default     = "Hot"
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}