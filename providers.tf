# AWS Provider Configuration
provider "aws" {
  region = "us-east-1"  # Change if needed
}

# Azure Provider Configuration
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

