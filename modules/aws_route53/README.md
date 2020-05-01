# Amazon DNS Records aws_route53

This module can be used to set DNS records for VPS

## example

```terraform
module "dns" {
  source = "./nested/aws_route53"
  vps = {"myname" = "127.0.0.1"}
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  dns_dev_zone   = var.dns_dev_zone
}
```
