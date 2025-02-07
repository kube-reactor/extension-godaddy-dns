
function godaddy_dns_records () {
  DNS_A_RECORDS=""
  for host in $(dns_hosts); do
    for ip in $(dns_ip); do
      local a_host="${host%".$CLOUDFLARE_DOMAIN"}"
      local a_record="\"${a_host}\":\"${ip}\""
      if [ ! "$DNS_A_RECORDS" ]; then
        DNS_A_RECORDS="${DNS_A_RECORDS}${a_record}"
      else
        DNS_A_RECORDS="${DNS_A_RECORDS},${a_record}"
      fi
    done
  done
  export TF_VAR_a_records="{${DNS_A_RECORDS}}"

  DNS_CNAME_RECORDS=""
  for host in $(dns_hosts); do
    for hostname in $(dns_hostname); do
      local cname_host="${host%".$CLOUDFLARE_DOMAIN"}"
      local cname_record="\"${cname_host}\":\"${hostname}\""
      if [ ! "$DNS_CNAME_RECORDS" ]; then
        DNS_CNAME_RECORDS="${DNS_CNAME_RECORDS}${cname_record}"
      else
        DNS_CNAME_RECORDS="${DNS_CNAME_RECORDS},${cname_record}"
      fi
    done
  done
  export TF_VAR_cname_records="{${DNS_CNAME_RECORDS}}"

  debug "TF_VAR_a_records: ${TF_VAR_a_records}"
  debug "TF_VAR_cname_records: ${TF_VAR_cname_records}"
}

function save_dns_records_godaddy () {
  godaddy_dns_records
  provisioner_create godaddy_dns "${__godaddy_dns_project_dir}"
}

function remove_dns_records_godaddy () {
  godaddy_dns_records
  provisioner_destroy godaddy_dns "${__godaddy_dns_project_dir}"
}
