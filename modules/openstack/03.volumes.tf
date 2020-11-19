### Create Volumes
resource "libvirt_volume" "base_volume" {
  name = "base_volume.qcow2"
  source = var.image_volume
  pool = var.volume_pool_name
}

resource "libvirt_volume" "controller_volume" {
  name = "controller_${ var.servername }_${count.index+1}.qcow2"
  pool = var.volume_pool_name
  base_volume_id = libvirt_volume.base_volume.id
  size = var.controller_size
  count = var.controller_count
}

resource "libvirt_volume" "compute_volume" {
  name = "compute_${ var.servername }_${count.index+1}.qcow2"
  pool = var.volume_pool_name
  base_volume_id = libvirt_volume.base_volume.id
  size = var.compute_size
  count = var.compute_count
}
