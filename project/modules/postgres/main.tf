terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_mdb_postgresql_cluster" "postgresql" {
  name        = "pg-cluster"
  environment = "production"

  network_id = var.network_id
   host {
        zone    = "ru-central1-a"
        subnet_id = var.subnet_id
        resources {
            resource_preset = "s3.micro"
            disk {
                type = "network-ssd"
                size = 20
            }
        }
    }

    config {
        version = "13"
        # Дополнительные параметры конфигурации
        postgres {
            settings {
                max_connections = 100
                shared_buffers = "128MB"
                # Добавьте другие настройки, если необходимо
            }
        }
    }
}

resource "yandex_mdb_postgresql_database" "db" {
  cluster_id = yandex_mdb_postgresql_cluster.postgresql.id
  name       = var.db_name
}

resource "yandex_mdb_postgresql_user" "db_user" {
  cluster_id = yandex_mdb_postgresql_cluster.postgresql.id
  name       = var.db_user
  password   = var.db_password
}
