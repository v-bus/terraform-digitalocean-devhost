# Module VPS DigigtalOcean hosts

This module creates do VPS by input variable list with OSs and its count

`dev_user` is used to create host-names like

> dev61-yourname

## example

```terraform
module "vps" {
  source       = "./moduls/digitalocean"
  vps_list     = {"ubuntu_18" = 2} # key from image list see below
  dev_user     = var.dev_user
  do_token     = var.do_token
}
```

### DO sizes

```bash
"s-1vcpu-1gb"
"512mb"
"s-1vcpu-2gb"
"1gb"
"s-3vcpu-1gb"
"s-2vcpu-2gb"
"s-1vcpu-3gb"
"s-2vcpu-4gb"
"2gb"
"s-4vcpu-8gb"
"m-1vcpu-8gb"
"c-2"
"4gb"
"g-2vcpu-8gb"
"gd-2vcpu-8gb"
"m-16gb"
"s-6vcpu-16gb"
"c-4"
"8gb"
"m-2vcpu-16gb"
```

### Available images

```tfvars
  default = {
    "ubuntu_16" = "ubuntu-16-04-x64"
    "debian_9"  = "debian-9-x64"
    "centos_7"  = "centos-7-x64"
    "ubuntu_18" = "ubuntu-18-04-x64"
    "ubuntu_19" = "ubuntu-19-10-x64"
    "ubuntu_20" = "ubuntu-20-04-x64"
    "debian_10" = "debian-10-x64"
    "centos_8"  = "centos-8-x64"
    "fedora_31" = "fedora-31-x64"
    "fedora_32" = "fedora-32-x64"
  }
```

### region examples

```bash
"nyc1"
"sgp1"
"lon1"
"nyc3"
"ams3"
"fra1"
"tor1"
"sfo2"
"blr1"
```
