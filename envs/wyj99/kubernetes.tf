module "kubernetes_module" {
  source = "../../modules/kubernetes"

### General
  servername = "wyj99"

### Volume
  volume_pool_name = "yjwang_pool"
  volume_pool_dir = "/data/yjwang_pool"
  image_volume = "/usr/vm-template/CentOS-8.2.qcow2"

### Netowrk
  net_deploy_name = "wyj99_deploy0"
  net_deploy = "10.98.91.0/24"
  net_deploy_address = "10.98.91"

  net_api_name = "wyj99_api0"
  net_api = "10.98.63.0/24"
  net_api_address = "10.98.63"

### About Nodes
  master_cpu = 8
  master_mem = 16384
  master_count = 0
  master_size = 25474836480

  worker_cpu = 8
  worker_mem = 16384
  worker_count = 0
  worker_size = 25474836480

  deploy_cpu = 8
  deploy_mem = 16384
  deploy_count = 1
  deploy_size = 15474836480
}
