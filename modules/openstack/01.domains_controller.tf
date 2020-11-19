resource "libvirt_domain" "controller" {
  name   = "${ var.servername }_controller_${ count.index }"
  memory = var.controller_mem
  vcpu   = var.controller_cpu
  count  = var.controller_count

  autostart = true
  arch = "x86_64"
  
  cloudinit = libvirt_cloudinit_disk.libvirt_init.id
  disk {
	volume_id = libvirt_volume.controller_volume[count.index].id
	}

  network_interface {
	network_id = libvirt_network.deploy_network.id
	addresses = ["${ var.net_deploy_address }.${ count.index + 10 }"]
	}

  network_interface {
	network_id = libvirt_network.api_network.id
	addresses = ["${ var.net_api_address }.${ count.index + 10 }"]
	}

  network_interface {
	bridge = "br0"
	}

  console {
	type = "pty"
	target_port = "0"
 	}
}
