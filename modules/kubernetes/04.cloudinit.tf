### Master
resource "libvirt_cloudinit_disk" "master_init" {
	name = "${var.servername}_master_cloutinit_${count.index}.iso"
	user_data = data.template_file.master_user_data[count.index].rendered
  network_config = data.template_file.master_network_data[count.index].rendered

  count = var.master_count
}

data "template_file" "master_user_data" {
  count = var.master_count
	template = file("${path.module}/cloudinit/master_deploy_init.cfg")

  vars = {
    master_hostname = "${ var.servername }_master_${ count.index }"
  }
}

data "template_file" "master_network_data" {
  count = var.master_count
	template = file("${path.module}/cloudinit/master_network_config.cfg")

  vars = {
    master_deploy_address = "${ var.net_deploy_address }.${ count.index + 10 }"
    deploy_gateway = "${ var.net_deploy_address}.1"

    master_api_address = "${ var.net_api_address }.${ count.index + 10 }"
    api_gateway = "${ var.net_api_address}.1"
  }
}

### Worker
resource "libvirt_cloudinit_disk" "worker_init" {
	name = "${var.servername}_worker_cloutinit_${count.index}.iso"
	user_data = data.template_file.worker_user_data[count.index].rendered
  network_config = data.template_file.worker_network_data[count.index].rendered

  count = var.worker_count
}

data "template_file" "worker_user_data" {
  count = var.worker_count
	template = file("${path.module}/cloudinit/worker_deploy_init.cfg")

  vars = {
    worker_hostname = "${ var.servername }_worker_${ count.index }"
  }
}

data "template_file" "worker_network_data" {
  count = var.worker_count
	template = file("${path.module}/cloudinit/worker_network_config.cfg")

  vars = {
    worker_deploy_address = "${ var.net_deploy_address }.${ count.index + 20 }"
    deploy_gateway = "${ var.net_deploy_address}.1"

    worker_api_address = "${ var.net_api_address }.${ count.index + 20 }"
    api_gateway = "${ var.net_api_address}.1"
  }
}

### deploy
resource "libvirt_cloudinit_disk" "deploy_init" {
	name = "${var.servername}_deploy_cloutinit_${count.index}.iso"
	user_data = data.template_file.deploy_user_data[count.index].rendered
  network_config = data.template_file.deploy_network_data[count.index].rendered

  count = var.deploy_count
}

data "template_file" "deploy_user_data" {
  count = var.deploy_count
	template = file("${path.module}/cloudinit/deploy_deploy_init.cfg")

  vars = {
    deploy_hostname = "${ var.servername }_deploy_${ count.index }"
  }
}

data "template_file" "deploy_network_data" {
  count = var.deploy_count
	template = file("${path.module}/cloudinit/deploy_network_config.cfg")

  vars = {
    deploy_deploy_address = "${ var.net_deploy_address }.${ count.index + 90 }"
    deploy_gateway = "${ var.net_deploy_address}.1"

    deploy_api_address = "${ var.net_api_address }.${ count.index + 90 }"
    api_gateway = "${ var.net_api_address}.1"
  }
}
