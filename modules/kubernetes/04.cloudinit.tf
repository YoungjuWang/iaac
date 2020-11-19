resource "libvirt_cloudinit_disk" "libvirt_init" {
	name = "${var.servername}_cloutinit.iso"
	user_data = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
	template = file("${path.module}/cloudinit/deploy_init.cfg")
}
