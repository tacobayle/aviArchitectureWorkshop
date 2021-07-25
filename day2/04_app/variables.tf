variable "docker_registry_username" {}
variable "docker_registry_password" {}
variable "vsphere_password" {}

variable "vcenter" {
  type = map
  default = {
    dc = "sof2-01-vc08"
    cluster = "sof2-01-vc08c01"
    datastore = "sof2-01-vc08c01-vsan"
    resource_pool = "sof2-01-vc08c01/Resources"
    folder = "AAWorkshop"
    networkMgmt = "vxw-dvs-34-virtualwire-3-sid-1080002-sof2-01-vc08-avi-mgmt"
    username = "aviuser6"
    server = "sof2-01-vc08.oc.vmware.com"
  }
}

variable "backend_vmw" {
  default = {
    cpu = 2
    memory = 4096
    disk = 20
    username = "ubuntu"
    network = "vxw-dvs-34-virtualwire-117-sid-1080116-sof2-01-vc08-avi-dev113"
    wait_for_guest_net_timeout = 2
    template_name = "ubuntu-bionic-18.04-cloudimg-template"
    ipsData = ["100.64.130.207", "100.64.130.208"]
    netplanFile = "/etc/netplan/50-cloud-init.yaml"
    maskData = "/24"
    public_key_path = "~/.ssh/cloudKey.pub"
    private_key_path = "~/.ssh/cloudKey"
    url_demovip_server = "https://github.com/tacobayle/demovip_server"
  }
}