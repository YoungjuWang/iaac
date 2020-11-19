terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.2"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

module "Openstack_module" {
  source = "../../modules/openstack"

### General
  servername = "wyj01"

### Volume
  volume_pool_name = "yjwang_pool"
  volume_pool_dir = "/data/yjwang_pool"
  image_volume = "/usr/vm-template/CentOS-8.2.qcow2"

### Netowrk
  net_deploy_name = "wyj_deploy0"
  net_deploy = "10.62.90.0/24"
  net_deploy_address = "10.62.90"
 
  net_api_name = "wyj_api0"
  net_api = "10.62.62.0/24"
  net_api_address = "10.62.62"

### About Nodes
  controller_count = 3
  controller_size = 35474836480
  controller_mem = 8192
  controller_cpu = 8

  compute_count = 3
  compute_size = 25474836480
  compute_mem = 8192
  compute_cpu = 8
}

