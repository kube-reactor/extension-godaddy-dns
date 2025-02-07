#
#=========================================================================================
# Initialization
#
#
# Project Directories
#
export __godaddy_dns_extension_dir="${2}"
export __godaddy_dns_terraform_dir="${__godaddy_dns_extension_dir}/terraform"
export __godaddy_dns_project_dir="${__godaddy_dns_terraform_dir}/dns"

if [ "${DNS_PROVIDER:-}" == "godaddy" ]; then
  export GODADDY_API_KEY="${GODADDY_API_KEY:-}"
  export GODADDY_API_SECRET="${GODADDY_API_SECRET:-}"
  export GODADDY_DOMAIN="${GODADDY_DOMAIN:-}"

  if [[ ! "$GODADDY_API_KEY" ]] && [[ "$GODADDY_API_SECRET" ]] && [[ ! "$GODADDY_DOMAIN" ]]; then
    emergency "To provision Godaddy resources, you must specify GODADDY_API_KEY, GODADDY_API_SECRET and GODADDY_DOMAIN environment variables"
  fi

  export TF_VAR_root_domain="$GODADDY_DOMAIN"
fi
