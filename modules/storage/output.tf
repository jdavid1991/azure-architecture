
output "storage_account_id" {
  value = {
    for k, v in azurerm_storage_account.storage : k => v.id
  }
}

output "storage_account_name" {
  value = {
    for k, v in azurerm_storage_account.storage : k => v.name
  }
}

output "storage_share_name" {
  value = {
    for k, v in azurerm_storage_share.data_share : k => v.name
  }
}

output "storage_account_key" {
  value = {
    for k, v in azurerm_storage_account.storage : k => v.primary_access_key
  }
}
