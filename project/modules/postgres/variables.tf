variable "network_id" {
  description = "ID VPC"
  type        = string
}

variable "private_subnet_id" {
  description = "ID приватной подсети"
  type        = string
}

variable "zone" {
  description = "Зона"
  type        = string
}

variable "db_name" {
  description = "Имя базы данных"
  type        = string
}

variable "db_user" {
  description = "Имя пользователя базы данных"
  type        = string
}

variable "db_password" {
  description = "Пароль пользователя базы данных"
  type        = string
}
