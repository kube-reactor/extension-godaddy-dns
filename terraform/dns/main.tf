
resource "godaddy-dns_record" "a_record" {
  for_each = var.a_records
  domain   = var.root_domain
  name     = each.key
  type     = "A"
  data     = each.value
  ttl      = 600
}

resource "godaddy-dns_record" "cname_record" {
  for_each = var.cname_records
  domain   = var.root_domain
  name     = each.key
  type     = "CNAME"
  data     = each.value
  ttl      = 600
}
