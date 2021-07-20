# Outputs for Terraform

output "controllers_ip" {
  value = vsphere_virtual_machine.controller.*.default_ip_address
}

output "avi_version" {
  value = split("-", basename(var.vcenter.content_library.file))[1]
}