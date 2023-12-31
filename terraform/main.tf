resource "azurerm_resource_group" "networking" {
  location = "uksouth"
  name     = "infra-networking"
}

resource "azurerm_resource_group" "resources" {
  location = "uksouth"
  name     = "infra-resources"
}

resource "azurerm_key_vault" "this" {
  location                  = "uksouth"
  name                      = "infra-secrets-msl8r"
  resource_group_name       = azurerm_resource_group.networking.name
  sku_name                  = "standard"
  tenant_id                 = "02a438dc-5f2b-4617-a0cc-c7b4e199dcaa"
  enable_rbac_authorization = true
}

resource "random_id" "this" {
  byte_length = 8
}

resource "azurerm_resource_group" "new" {
  location = "uksouth"
  name     = random_id.this.id
}