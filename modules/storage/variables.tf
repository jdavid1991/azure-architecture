
variable "environment" {
  description = "Entornos de despliegue"
  type        = string
}

variable "location" {
  description = "Zona de implementación"
  type        = string
}

variable "rg_name" {
  description = "Nombre resource_group"
  type        = string
}

variable "vnet_name" {
  description = "Nombre vnet"
  type        = string
  default     = "gravewave"
}

variable "subnet_id" {
  description = "Subnet_id"
  type        = string
}

variable "default_action_network" {
  description = "Permite asignar la acción por defecto al env requerido"
  type = string
  default = "Allow"

  validation {
    condition = contains(["Allow", "Deny"], var.default_action_network)
    error_message = "solo se permite 'Allow' o 'Deny'"
  }
}

variable "tags" {
  description = "Etiquetas que vienen desde la raiz"
  type        = map(string)
  default     = {}
}
