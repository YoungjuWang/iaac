resource "libvirt_domain" "master" {
  name   = "${ var.servername }_master_${ count.index }"
  memory = var.master_mem
  vcpu   = var.master_cpu
  count  = var.master_count

  autostart = true
  arch = "x86_64"
  
  cloudinit = libvirt_cloudinit_disk.libvirt_init.id
  disk {
	volume_id = libvirt_volume.master_volume[count.index].id
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
