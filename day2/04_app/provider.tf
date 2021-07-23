provider "vsphere" {
  user           = var.vcenter.username
  password       = var.vsphere_password
  vsphere_server = var.vcenter.server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}