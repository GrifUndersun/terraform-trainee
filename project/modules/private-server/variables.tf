variable "zone" {
  description = "Зона"
  type        = string
}

variable "private_subnet_id" {
  description = "ID приватной подсети"
  type        = string
}

variable "image_id" {
  description = "ID образа для создания ВМ"
  type        = string
}

variable "public_key_path" {
  description = "Путь к публичному SSH-ключу"
  type        = string
}
