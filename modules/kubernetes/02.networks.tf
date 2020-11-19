resource "libvirt_network" "deploy_network" {
  name = var.net_deploy_name
  addresses = [var.net_deploy]
  mode = "nat"
  autostart = true
  bridge = var.net_deploy_name
}

resource "libvirt_network" "api_network" {
  name = var.net_api_name
  addresses = [var.net_api]
  mode = "nat"
  autostart = true
  bridge = var.net_api_name
}
