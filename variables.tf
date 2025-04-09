variable "ohio_cidr" {
  description = "CIDR Ohio"
  type        = string
}

variable "subnets_cidr" {
  description = "Mapa de nombres de subnets a sus respectivos bloques CIDR."
  type        = map(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}
