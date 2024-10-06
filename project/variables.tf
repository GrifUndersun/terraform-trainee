variable "ssh_access" {
  description = "IP и имя правила для доступа по SSH"
  type = object({
    ip   = string
    name = string
  })
}