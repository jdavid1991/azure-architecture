
locals {
  #Naming conventions
  common_prefix = var.vnet_name
  environment   = var.environment

  vn_name = "vn-${local.common_prefix}-${local.environment}"
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = local.vn_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "frontend"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "nsga" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = var.nsg_id
}
