output "dev_hosts" {
  description = "map of objects with vps-hostname = { vps-FQDN = vps-ipv4_address}"
  value = {
    for hostname, ipv4_address in module.vps.dev_vps : hostname => {
      for fqdn, rec_ipv4_address in module.dns.dns_dev_records :
      fqdn => ipv4_address if rec_ipv4_address == ipv4_address
    }
  }
}
