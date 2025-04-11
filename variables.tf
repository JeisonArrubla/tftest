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

variable "ingress_cidr_sg" {
  description = "CIDR para el tráfico de entrada"
  type        = string
}

variable "ec2_specs" {
  description = "Parametros de la instancia"
  type        = map(string)
}

variable "ingress_ports_list" {
  description = "Lista de puertos de ingress"
  type        = list(number)
}
