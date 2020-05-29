variable "aws_access_key" {
  description = "required: AWS Access Key"
}
variable "aws_secret_key" {
  description = "required: AWS Secret Key"
}
variable "dns_dev_zone" {
  description = "required: public DNS zone"
}
variable "vps_list" {
  description = <<EOT
  list of VPSs names should be the same as var.server_image. 
  example {
            "ubuntu_16"     = 1
            "debian_9"      = 1
            "centos_7"      = 1
            "ubuntu_18"     = 1
            "debian_10"     = 1
            "centos_8"      = 1
            "fedora_31"     = 1
          }
  EOT
  type        = map(any)
}
variable "dev_user" {
  description = "postfix in hostname like dev$N-username"
}
variable "token" {
  description = "Access token to do API"
}
variable "dev_ssh_key" {
  description = "Name of SSH key"
  default     = "dev_ssh_key"
}
variable "opt_ssh_key_name" {
  description = "Predefined SSH Key, ex. team key"
  default     = null
  type        = string
}
variable "tags" {
  description = "Tags to droplet. User-defined tags list of values"
  type        = list(string)
}
variable "region" {
  description = "Digital Ocean region"
  default     = "ams3"
}