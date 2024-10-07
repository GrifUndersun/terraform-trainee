terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_mdb_postgresql_cluster" "foo" {
  name        = "pg-cluster"
  environment = "PRESTABLE"
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

resource "yandex_mdb_postgresql_database" "pg_db" {
  cluster_id = yandex_mdb_postgresql_cluster.foo.id
  name       = var.db_name
  owner      = yandex_mdb_postgresql_user.pguser.name
  lc_collate = "en_US.UTF-8"
  lc_type    = "en_US.UTF-8"
}

resource "yandex_mdb_postgresql_user" "pguser" {
  cluster_id = yandex_mdb_postgresql_cluster.foo.id
  name       = "pguser"
  password   = var.db_password
}
