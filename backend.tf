provider "azurerm" {
  features {}
}

# these would be parameterised in a real-world scenario
# but ive hardcoded here for simplicity
terraform {
    # backend "azurerm" {
    #     resource_group_name  = "tfstate-rg"
    #     storage_account_name = "tfstatestorage"
    #     container_name       = "tfstate"
    #     key                  = "maininfra.tfstate"
    # }
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 3.0"
        }
  }
}

