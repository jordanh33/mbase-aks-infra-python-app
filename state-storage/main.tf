provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfstate-rg" {
  name     = "tfstate-rg"
  location = "uksouth"
}

resource "azurerm_storage_account" "storage" {
  name                     = "tfstatestorage"
  resource_group_name      = azurerm_resource_group.tfstate-rg.name
  location                 = azurerm_resource_group.tfstate-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}
