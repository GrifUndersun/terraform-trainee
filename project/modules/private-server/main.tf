terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "private_server" {
  name        = "private-server"
  platform_id = "standard-v2"
  zone        = var.zone
  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = var.private_subnet_id
  }
  # metadata = {
  #   ssh-keys = "debian:${file(var.public_key_path)}"
  # }
}
