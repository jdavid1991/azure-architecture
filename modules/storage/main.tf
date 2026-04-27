
locals {
  #Naming conventions
  common_prefix = "st"
  environment   = var.environment

  st_name = ["backupxyz", "dataxyz"]
}

resource "azurerm_storage_account" "storage" {
  for_each = toset(local.st_name)

  name                = "${local.common_prefix}${each.key}${local.environment}"
  resource_group_name = var.rg_name

  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = var.tags
}

resource "azurerm_storage_container" "container" {
  for_each = toset(local.st_name)

  name                  = "${local.common_prefix}${each.key}${local.environment}"
  storage_account_id    = azurerm_storage_account.storage[each.key].id
  container_access_type = "private"
}

resource "azurerm_storage_share" "data_share" {
  for_each = toset(local.st_name)

  name               = "vm-files"
  storage_account_id = azurerm_storage_account.storage[each.key].id
  quota              = 100
}

resource "azurerm_storage_account_network_rules" "rules" {
  for_each = toset(local.st_name)

  storage_account_id = azurerm_storage_account.storage[each.key].id

  default_action             = var.default_action_network
  virtual_network_subnet_ids = [var.subnet_id]
  bypass                     = ["AzureServices"]

}


