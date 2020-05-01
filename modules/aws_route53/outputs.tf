output "dns_dev_records" {
  description = "map of {FQDN = ipv4_address} of developer's host(-s)"
  value = {
    for dns_record in aws_route53_record.aws_dev_record : dns_record.fqdn => tolist(dns_record.records)[0]
  }
}
