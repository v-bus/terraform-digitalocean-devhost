output "dev_vps" {
  description = "map of hostname and ipv4 address"
  value       = { for host in hcloud_server.dev_vps : host.name => host.ipv4_address }
}
