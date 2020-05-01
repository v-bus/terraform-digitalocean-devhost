####################################
# Configure the Hetzner Cloud Provider
##########################
provider "hcloud" {
  token = var.hcloud_token
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
}
data "hcloud_image" "dev_image" {
  count       = length(var.vps_list)
  name        = var.server_image[keys(var.vps_list)[count.index]]
  most_recent = true
}

resource "hcloud_ssh_key" "dev_ssh_key" {
  name       = "dev_ssh"
  public_key = file(var.dev_ssh_pub_path)
}

resource "hcloud_server" "dev_vps" {
  count       = length(local.devs)
  name        = local.devs[count.index]["hostname"]
  image       = var.server_image[local.devs[count.index]["os"]]
  server_type = var.server_type
  ssh_keys = [
    hcloud_ssh_key.dev_ssh_key.id
  ]
  labels = var.tags
}