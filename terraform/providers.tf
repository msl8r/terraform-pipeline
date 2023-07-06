terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.43.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = var.storage_account_name
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    subscription_id      = var.subscription_id
    tenant_id            = var.tenant_id
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

