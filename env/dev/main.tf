
module "rg" {
  source      = "../../modules/rg"
  environment = var.environment
  location    = var.location

  tags = local.common_tags
}

module "vnet" {
  source = "../../modules/vnet"

  environment      = var.environment
  location         = var.location
  rg_name          = module.rg.rg_name
  subnet_name      = var.subnet_name
  address_prefixes = var.address_prefixes
  address_space    = var.address_space
  dns_servers      = var.dns_servers
  nsg_id           = module.nsg.nsg_id

  tags = local.common_tags
}

module "nsg" {
  source = "../../modules/nsg"

  environment = var.environment
  location    = var.location
  rg_name     = module.rg.rg_name

  tags = local.common_tags
}

module "vm" {
  source = "../../modules/vm"

  rg_name        = module.rg.rg_name
  location       = var.location
  subnet_id      = module.vnet.subnet_id
  admin_username = var.admin_username
  admin_password = var.admin_password
  size_vm        = var.size_vm

  tags = local.common_tags
}
