<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_godaddy-dns"></a> [godaddy-dns](#requirement\_godaddy-dns) | ~> 0.3.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_godaddy-dns"></a> [godaddy-dns](#provider\_godaddy-dns) | ~> 0.3.12 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| godaddy-dns_record.a_record | resource |
| godaddy-dns_record.cname_record | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | DNS A records | `map(string)` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | DNS CNAME records | `map(string)` | n/a | yes |
| <a name="input_root_domain"></a> [root\_domain](#input\_root\_domain) | DNS root domain (zone) | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->