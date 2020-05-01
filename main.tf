terraform {
  required_version = ">= 0.12"
  required_providers {
    aws          = "~> 2.54"
    digitalocean = "~> 1.17"
  }
}

module "vps" {
  source      = "./modules/digitalocean"
  vps_list    = var.vps_list
  dev_user    = var.dev_user
  token       = var.token
  region      = var.region
  dev_ssh_key = var.dev_ssh_key
  tags        = var.tags
}

module "dns" {
  source         = "./modules/aws_route53"
  vps            = module.vps.dev_vps
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  dns_dev_zone   = var.dns_dev_zone
  aws_depends_on = [module.vps]
}
