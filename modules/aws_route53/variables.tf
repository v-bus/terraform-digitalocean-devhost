variable "vps" {
  description = "required: map with hostname and IP {\"name\" = \"ipv4_address\"}"
  default     = null
}
variable "dns_dev_zone" {
  description = "required: public DNS zone yourdomain.net."
}

variable "aws_region" {
  description = "optional: default aws provider region will fail if you dont have "
  default     = "eu-central-1"
}

variable "aws_access_key" {
  description = "required: AWS Access Key"
}

variable "aws_secret_key" {
  description = "required: AWS Secret Key"
}
variable "aws_depends_on" {
  description = "required: sould point to another submodule (https://discuss.hashicorp.com/t/tips-howto-implement-module-depends-on-emulation/2305/2)"
  type        = any
  default     = null
}