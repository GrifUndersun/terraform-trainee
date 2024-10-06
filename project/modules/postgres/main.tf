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
  master_host {
    zone = var.zone
    subnet_id = var.private_subnet_id
    resources {
      resource_preset_id = "s2.micro"
      disk_size = 10
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
