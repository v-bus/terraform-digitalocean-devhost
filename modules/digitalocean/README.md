# Module VPS hcloud hosts

This module creates HCloud VPS by input variable list with OSs and its count

`dev_user` is used to create host-names like

> dev61-yourname

## example

```terraform
module "vps" {
  source       = "./nested/hcloud"
  vps_list     = {"ubuntu_18" = 2}
  dev_user     = var.dev_user
  hcloud_token = var.hcloud_token
}
```
