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

resource "libvirt_pool" "yjwang_volume_pool" {
  name = var.volume_pool_name
  type = "dir"
  path = var.volume_pool_dir
}
