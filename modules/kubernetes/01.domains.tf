### Master
resource "libvirt_domain" "master" {
  name   = "${ var.servername }_master_${ count.index }"
  vcpu   = var.master_cpu
  memory = var.master_mem
  count  = var.master_count

  autostart = true
  arch = "x86_64"

  cloudinit = libvirt_cloudinit_disk.master_init[count.index].id

  disk {
	volume_id = libvirt_volume.master_volume[count.index].id
	}

  network_interface { bridge = "br0" }
  network_interface { network_id = libvirt_network.deploy_network.id }
  network_interface { network_id = libvirt_network.api_network.id}

  console {
	type = "pty"
	target_port = "0"
 	}
}

### Worker
resource "libvirt_domain" "worker" {
  name   = "${ var.servername }_worker_${ count.index }"
  vcpu   = var.worker_cpu
  memory = var.worker_mem
  count  = var.worker_count

  autostart = true
  arch = "x86_64"

  cloudinit = libvirt_cloudinit_disk.worker_init[count.index].id

  disk {
	volume_id = libvirt_volume.worker_volume[count.index].id
	}

  network_interface { bridge = "br0" }
  network_interface { network_id = libvirt_network.deploy_network.id }
  network_interface { network_id = libvirt_network.api_network.id}

  console {
	type = "pty"
	target_port = "0"
 	}
}

### Deploy
resource "libvirt_domain" "deploy" {
  name   = "${ var.servername }_deploy_${ count.index }"
  vcpu   = var.deploy_cpu
  memory = var.deploy_mem
  count  = var.deploy_count

  autostart = true
  arch = "x86_64"

  cloudinit = libvirt_cloudinit_disk.deploy_init[count.index].id

  disk {
	volume_id = libvirt_volume.deploy_volume[count.index].id
	}

  network_interface { bridge = "br0" }
  network_interface { network_id = libvirt_network.deploy_network.id }
  network_interface { network_id = libvirt_network.api_network.id}

  console {
	type = "pty"
	target_port = "0"
 	}
}
