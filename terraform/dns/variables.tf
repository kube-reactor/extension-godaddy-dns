variable "root_domain" {
  description = "DNS root domain (zone)"
  type        = string
}

variable "a_records" {
  description = "DNS A records"
  type        = map(string)
}

variable "cname_records" {
  description = "DNS CNAME records"
  type        = map(string)
}
