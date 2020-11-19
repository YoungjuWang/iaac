resource "libvirt_cloudinit_disk" "libvirt_init" {
	name = "${var.servername}_cloutinit.iso"
	user_data = data.template_file.user_data.rendered
	network_config = data.template_file.network_config.rendered
}

data "template_file" "user_data" {
	template = file("${path.module}/cloudinit/deploy_init.cfg")
}

data "template_file" "network_config" {
	template = file("${path.module}/cloudinit/network_config.cfg")
}
