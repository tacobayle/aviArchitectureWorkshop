resource "vsphere_content_library" "library" {
  name            = var.vcenter.content_library.name
  storage_backing = [data.vsphere_datastore.datastore.id]
  description     = var.vcenter.content_library.description
}

resource "vsphere_content_library_item" "aviController" {
  name        = basename(var.vcenter.content_library.file)
  library_id  = vsphere_content_library.library.id
  file_url = "/home/bin/${basename(var.vcenter.content_library.file)}"
}