variable "environment" {
  description = "Entornos de despliegue"
  type        = string
}

variable "location" {
  description = "Zona de implementación"
  type        = string
}

variable "tags" {
  type = map(string)
  description = "Etiquetas que vienen desde la raiz"
  default = {}
}