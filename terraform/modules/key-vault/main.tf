data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = "${var.project_name}-${var.environment}-kv"
  location                    = var.location
  resource_group_name         = var.resource_group_name

  tenant_id                   = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  rbac_authorization_enabled = true
}