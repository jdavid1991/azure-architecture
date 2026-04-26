
locals {
  common_tags = {
    Owner       = "gravewave"
    Environment = var.environment
    Project     = "azure-architecture"
    ManagedBy   = "Terraform"
    CreateDate  = "26-04-2026"
    Region      = var.location
  }
}

variable "environment" {
  description = "Entornos de despliegue"
  type        = string
  validation {
    condition     = contains(["dev", "prod", "stg"], var.environment)
    error_message = "Env. permitidos: 'prod','dev','stg'"
  }
}

variable "location" {
  description = "Zona de implementación"
  type        = string
  validation {
    condition     = var.location == "mexicocentral"
    error_message = "Location permitida: mexicocentral"
  }
}

#Networking
variable "vnet_name" {
  description = "Nombre vnet"
  type        = string
  default     = "gravewave"
}

variable "address_space" {
  description = "value"
  type        = list(string)
}

variable "dns_servers" {
  description = "Dirección de servidores dns"
  type        = list(string)
}

variable "address_prefixes" {
  description = "value"
  type        = list(string)
}

variable "subnet_name" {
  description = "Nombre de la subnet"
  type        = string
}

#Virtual Machine
variable "admin_username" {
  description = "Usuario Admin"
  type        = string
}

variable "admin_password" {
  description = "Password Admin"
  type        = string
}

variable "size_vm" {
  description = "Tamaño maquina virtual"
  type        = string
}

