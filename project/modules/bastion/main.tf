terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "bastion" {
  name        = "bastion-host"
  platform_id = "standard-v1"
  zone        = var.zone
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  network_interface {
    subnet_id = var.public_subnet_id
    nat       = true
  }
  metadata = {
    ssh-keys = "debian:${file(var.public_key_path)}"
  }
}
