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