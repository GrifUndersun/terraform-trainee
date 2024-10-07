variable "zone" {
  description = "Зона"
  type        = string
}

variable "public_subnet_id" {
  description = "ID публичной подсети"
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

variable "user_data_file" {
  description = "Путь к публичному SSH-ключу"
  type        = string
}