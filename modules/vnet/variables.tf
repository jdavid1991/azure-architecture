
variable "environment" {
  description = "Entornos de despliegue"
  type        = string
}

variable "location" {
  description = "Zona de implementación"
  type        = string
}

variable "vnet_name" {
  description = "Nombre vnet"
  type        = string
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

variable "nsg_id" {
  description = "value"
  type = string
}

variable "rg_name" {
  description = "Nombre resource_group"
  type = string
}

variable "tags" {
  description = "Etiquetas que vienen desde la raiz"
  type = map(string)
  default = {}
}
