variable "network_id" {
  description = "ID VPC"
  type        = string
}

variable "ssh_rule_name" {
  description = "Имя правила для SSH"
  type        = string
}

variable "ssh_ip" {
  description = "IP адрес для SSH доступа"
  type        = string
}
