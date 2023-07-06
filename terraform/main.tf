resource "azurerm_resource_group" "this" {
  location = "uksouth"
  name     = "infra-networking"
}

resource "azurerm_resource_group" "resources" {
  location = "uksouth"
  name     = "infra-resources"
}

resource "azurerm_key_vault" "this" {
  location                  = "uksouth"
  name                      = "infra-secrets"
  resource_group_name       = azurerm_resource_group.this.name
  sku_name                  = "standard"
  tenant_id                 = "02a438dc-5f2b-4617-a0cc-c7b4e199dcaa"
  enable_rbac_authorization = true
}

