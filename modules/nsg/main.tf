locals {
  #Naming conventions
  common_prefix = var.vnet_name
  environment   = var.environment

  nsg_name = "nsg-${local.common_prefix}-${local.environment}"
}

resource "azurerm_network_security_group" "security_group" {
  name                = local.nsg_name
  resource_group_name = var.rg_name
  location            = var.location

  # SSH (Puerto 22) - Permite acceso desde un Bastion o red interna
  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }

  # HTTP (Puerto 80)
  security_rule {
    name                       = "AllowHttpYHttps"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443"]
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }

  # MYSQL (Puerto 3306)
  security_rule {
    name                       = "AllowMYSQL"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }

  tags = var.tags
}
