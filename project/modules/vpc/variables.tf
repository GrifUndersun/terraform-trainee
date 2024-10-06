variable "network_name" {
  description = "Имя сети"
  type        = string
}

variable "public_zone" {
  description = "Зона для публичной подсети"
  type        = string
}

variable "private_zone" {
  description = "Зона для приватной подсети"
  type        = string
}

variable "public_cidr_block" {
  description = "CIDR блок для публичной подсети"
  type        = string
}

variable "private_cidr_block" {
  description = "CIDR блок для приватной подсети"
  type        = string
}
