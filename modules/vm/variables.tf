
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

variable "storage_account_id" {
  description = "Storage id"
  type = string
}

variable "storage_account_name" {
  description = "Storage id"
  type = string
  default = "data"
}

variable "storage_share_name" {
  description = "nombre carpeta compartida"
  type = string
}

variable "storage_account_key" {
  description = "Access key de la cuenta de storage"
  type        = string
  sensitive   = true
}

variable "tags" {
  type = map(string)
  description = "Etiquetas que vienen desde la raiz"
  default = {}
}