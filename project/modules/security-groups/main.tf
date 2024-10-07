terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_vpc_default_security_group" "default-sg" {
  # name = "bastion-sg"
  network_id = var.network_id

  ingress {
    protocol        = "ANY"
    v4_cidr_blocks  = ["0.0.0.0/0"]
  }
  
  ingress {
    description = var.ssh_rule_name
    protocol    = "TCP"
    port        = 22
    v4_cidr_blocks = [var.ssh_ip]
  }

  egress {
    protocol        = "ANY"
    v4_cidr_blocks  = ["0.0.0.0/0"]
  }
}
