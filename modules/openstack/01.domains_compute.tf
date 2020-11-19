resource "libvirt_domain" "compute" {
  name   = "${ var.servername }_compute_${ count.index }"
  memory = var.compute_mem
  vcpu   = var.compute_cpu
  count  = var.compute_count

  autostart = true
  arch = "x86_64"
  
  cloudinit = libvirt_cloudinit_disk.libvirt_init.id
  disk {
	volume_id = libvirt_volume.compute_volume[count.index].id
	}

  network_interface {
	network_id = libvirt_network.deploy_network.id
	addresses = ["${ var.net_deploy_address }.${ count.index + 20 }"]
	}

  network_interface {
	network_id = libvirt_network.api_network.id
	addresses = ["${ var.net_api_address }.${ count.index + 20 }"]
	}

  network_interface {
	bridge = "br0"
	}

  console {
	type = "pty"
	target_port = "0"
 	}
}
