terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = "ru-central1-b"
  token = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
}

module "vpc" {
  source           = "./modules/vpc"
  network_name     = "my-vpc"
  public_zone      = "ru-central1-a"
  private_zone     = "ru-central1-b"
  public_cidr_block = "10.0.1.0/24"
  private_cidr_block = "10.0.2.0/24"
}

module "bastion" {
  source           = "./modules/bastion"
  zone             = "ru-central1-a"
  public_subnet_id = module.vpc.public_subnet_id
  image_id         = "fd801rku4j14mv7fs703"  # Используйте правильный ID образа
  public_key_path  = "~/.ssh/id_rsa.pub"
  user_data_file = file(var.user_data_file)
}

module "private_server" {
  source            = "./modules/private-server"
  zone              = "ru-central1-b"
  private_subnet_id = module.vpc.private_subnet_id
  image_id          = "fd801rku4j14mv7fs703"  # Используйте правильный ID образа
  public_key_path   = "~/.ssh/id_rsa.pub"
  user_data_file = file(var.user_data_file)

}

module "security_groups" {
  source      = "./modules/security-groups"
  network_id  = module.vpc.vpc_id
  ssh_rule_name = "SSH Access"
  ssh_ip      = var.ssh_access.ip
}

module "postgres" {
  source          = "./modules/postgres"
  network_id      = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_id
  zone            = "ru-central1-b"
  db_name         = "pg_db"
  db_user         = "pguser"
  db_password     = "P@ssw0rd"
}
