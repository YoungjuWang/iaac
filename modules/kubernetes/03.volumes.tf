### Create Volumes
resource "libvirt_volume" "base_volume" {
  name = "base_volume.qcow2"
  source = var.image_volume
  pool = var.volume_pool_name
}

resource "libvirt_volume" "master_volume" {
  name = "master_${ var.servername }_${count.index+1}.qcow2"
  pool = var.volume_pool_name
  base_volume_id = libvirt_volume.base_volume.id
  size = var.master_size
  count = var.master_count
}

resource "libvirt_volume" "worker_volume" {
  name = "worker_${ var.servername }_${count.index+1}.qcow2"
  pool = var.volume_pool_name
  base_volume_id = libvirt_volume.base_volume.id
  size = var.worker_size
  count = var.worker_count
}
