terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_mdb_postgresql_cluster" "foo" {
  name        = "pg-cluster"
  environment = "PRODUCTION"
  network_id  = var.network_id
  host {
    zone      = var.zone
    subnet_id = var.private_subnet_id
  }
  config {
    version = 15
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 16
    }
  }
  
}

# resource "yandex_mdb_postgresql_database" "db" {
#   cluster_id = yandex_mdb_postgresql_cluster.postgresql.id
#   name       = var.db_name
# }

# resource "yandex_mdb_postgresql_user" "db_user" {
#   cluster_id = yandex_mdb_postgresql_cluster.postgresql.id
#   name       = var.db_user
#   password   = var.db_password
# }
