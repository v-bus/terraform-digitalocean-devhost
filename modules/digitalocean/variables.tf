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
  default = {
    "ubuntu_18" = 1
  }
}
variable "dev_user" {
  description = "postfix in hostname like dev$N-username"
  default     = "username"
}

variable "token" {
  description = "Access token to do API"
}
variable "dev_ssh_key" {
  description = "Name of SSH key"
  default     = "dev_ssh_key"
}
variable "dev_ssh_pub_path" {
  description = "User public SSH RSA file path name"
  default     = "~/.ssh/id_rsa.pub"
}
variable "opt_ssh_key_name" {
  description = "Predefined SSH Key, ex. team key"
  default     = null
  type        = string
}
variable "server_image" {
  description = "do image collection"
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
}
variable "server_type" {
  description = "do size"
  default     = "s-1vcpu-1gb"
}
variable "region" {
  description = "Digital Ocean region"
  default     = "ams3"
}
variable "tags" {
  description = "Tags to droplet. User-defined tags list of values"
  type        = list(string)
}