terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"        # replace with your resource group name
    storage_account_name = "tfstateaccount"    # replace with your storage account name
    container_name       = "tfstate-container" # replace with your own container
    key                  = "jenkins-tfstate"   # replace with your own key
  }

  required_version = ">= 1.2.0"
}


provider "azurerm" {

  features {}
  subscription_id = "your-subscription-id-here" # replace with your subscription id

}