
variable "rg_name" {
  description = "Nombre resource_group"
  type = string
}

variable "location" {
  description = "Zona de implementación"
  type        = string
}

variable "subnet_id" {
  description = "Subnet_id"
  type = string
}

variable "admin_username" {
  description = "Usuario Admin"
  type = string
}

variable "admin_password" {
  description = "Password Admin"
  type = string
}

variable "size_vm" {
  description = "Tamaño maquina virtual"
  type = string
}

variable "tags" {
  type = map(string)
  description = "Etiquetas que vienen desde la raiz"
  default = {}
}