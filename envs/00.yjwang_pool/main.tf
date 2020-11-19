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

module "pool_module" {
  source = "../../modules/pool"
  volume_pool_name = "yjwang_pool"
  volume_pool_dir = "/data/yjwang_pool"
}
