# terraform-digitalocean-devhost

## quickstart

1. install Terraform (see [main.tf](main.tf) to check required versions)
1. `git clone` this module
1. set required variables in .tfvars file (see [variables.tf](variables.tf) file, required variables labeled as required)
1. run `terraform init`
1. run `terraform plan`

## using from your terraform code

example

```terraform
module "devs" {
    source = "github.com/v-bus/terraform-digitalocean-devhost"
    aws_access_key  = "asdfghjhgf"
    aws_secret_key  = "sdfghngfds"
    dns_dev_zone    = "yourname.net."
    vps_list        = {"ubuntu_18" = 2}
    dev_user        = "username"
    token    = "sdfghj,hgffghjkjhgf"
    tags            = ["value"]
}

output "out" {
    value = module.hdevs.dev_hosts
}
```
