terraform {
  required_version = ">= 0.12"
  required_providers {
    digitalocean = "~> 1.18"
  }
}
####################################
# Configure the Digital Ocean Provider
##########################
provider "digitalocean" {
  token = var.token
}
data "digitalocean_ssh_key" "opt_ssh_key" {
  count = var.opt_ssh_key_name != null ? 1 : 0
  name  = var.opt_ssh_key_name
}
locals {
  devs = flatten([
    for k in range(length(var.vps_list)) :
    [
      for i in range(values(var.vps_list)[k]) : jsondecode(<<EOT
                                                                                {
                                                                                    "hostname" : "dev${k}${i}-${var.dev_user}",
                                                                                    "os"    : "${keys(var.vps_list)[k]}"
                                                                                } 
                                                                            EOT
      )
    ]
  ])
  ssh_keys = var.opt_ssh_key_name != null ? [data.digitalocean_ssh_key.opt_ssh_key[0].id, digitalocean_ssh_key.dev_ssh_key.id] : [digitalocean_ssh_key.dev_ssh_key.id]
}

resource "digitalocean_ssh_key" "dev_ssh_key" {
  name       = var.dev_ssh_key
  public_key = file(var.dev_ssh_pub_path)
}

resource "digitalocean_droplet" "dev_vps" {
  count    = length(local.devs)
  name     = local.devs[count.index]["hostname"]
  image    = var.server_image[local.devs[count.index]["os"]]
  size     = var.server_type
  region   = var.region
  ssh_keys = local.ssh_keys
  tags     = var.tags
}