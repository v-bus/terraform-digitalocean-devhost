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
variable "hcloud_token" {
  description = "Access token to hcloud API"
}
variable "tags" {
  description = "Tags to VPS. User-defined labels map (key-value pairs)"
  type        = map(string)
}