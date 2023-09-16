terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }

  backend "azurerm" {
    container_name       = "tfstate"
    key                  = "github-azure.tfstate"
  }
}

provider "azurerm" {
    features {}
}
