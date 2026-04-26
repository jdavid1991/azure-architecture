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
  default     = "gravewave"
}

variable "rg_name" {
  description = "Nombre resource_group"
  type = string
}

variable "tags" {
  type = map(string)
  description = "Etiquetas que vienen desde la raiz"
  default = {}
}