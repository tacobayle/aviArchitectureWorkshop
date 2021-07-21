provider "vsphere" {
  user           = var.vcenter.username
  password       = var.vsphere_password
  vsphere_server = var.vcenter.server
  allow_unverified_ssl = true
}