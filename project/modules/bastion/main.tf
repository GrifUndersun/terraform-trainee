terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "bastion" {
  name        = "bastion-host"
  platform_id = "standard-v2"
  zone        = var.zone
  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = "fd807i0dlf0f2h3e83q5"
    }
  }
  network_interface {
    subnet_id = var.public_subnet_id
    nat       = true
  }
  metadata = {
    user-data = file(var.user_data_file)
  }
}
