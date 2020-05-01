terraform {
  required_version = ">= 0.12"
  required_providers {
    aws    = "~> 2.54"
    hcloud = "~> 1.15"
  }
}

module "vps" {
  source       = "./modules/hcloud"
  vps_list     = var.vps_list
  dev_user     = var.dev_user
  hcloud_token = var.hcloud_token
  tags         = var.tags
}

module "dns" {
  source         = "./modules/aws_route53"
  vps            = module.vps.dev_vps
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  dns_dev_zone   = var.dns_dev_zone
  aws_depends_on = [module.vps]
}
