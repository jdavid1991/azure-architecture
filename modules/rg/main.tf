locals {
  #Naming conventions
  common_prefix = "gravewave"
  environment   = var.environment

  rg_name = "${local.common_prefix}-${local.environment}"
}

resource "azurerm_resource_group" "resource_group" {
  name     = local.rg_name
  location = var.location

  tags = var.tags
}