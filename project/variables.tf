variable "ssh_access" {
  description = "IP и имя правила для доступа по SSH"
  type = object({
    ip   = string
    name = string
  })
}

variable "user_data_file" {
  description = "User-data для instance"
  default = "../user-data.txt"
}


variable "yc_token" {
  description = "OAuth токен для доступа к Yandex Cloud"
  type        = string
}

variable "yc_cloud_id" {
  description = "ID облака в Yandex Cloud"
  type        = string
}

variable "yc_folder_id" {
  description = "ID папки в Yandex Cloud"
  type        = string
}