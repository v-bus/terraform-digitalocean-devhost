output "dev_vps" {
  description = "map of hostname and ipv4 address"
  value       = { for host in digitalocean_droplet.dev_vps : host.name => host.ipv4_address }
}
