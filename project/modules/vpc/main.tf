terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_vpc_network" "vpc" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "public" {
  name           = "public-subnet"
  zone           = var.public_zone
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = [var.public_cidr_block]
}

resource "yandex_vpc_subnet" "private" {
  name           = "private-subnet"
  zone           = var.private_zone
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = [var.private_cidr_block]
}
