terraform {
  required_version = ">= 1.1.0"

  required_providers {
    godaddy-dns = {
      source  = "registry.terraform.io/veksh/godaddy-dns"
      version = "~> 0.3.12"
    }
  }
}

provider "godaddy-dns" {}
