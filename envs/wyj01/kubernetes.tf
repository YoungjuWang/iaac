module "kubernetes_module" {
  source = "../../modules/kubernetes"

### General
  servername = "wyj01"

### Volume
  volume_pool_name = "yjwang_pool"
  volume_pool_dir = "/data/yjwang_pool"
  image_volume = "/usr/vm-template/CentOS-8.2.qcow2"

### Netowrk
  net_deploy_name = "wyj01_deploy"
  net_deploy = "10.98.190.0/24"
  net_deploy_address = "10.98.190"

  net_api_name = "wyj01_api"
  net_api = "10.98.162.0/24"
  net_api_address = "10.98.162"

### About Nodes
  master_cpu = 8
  master_mem = 16384
  master_count = 2
  master_size = 35474836480

  worker_cpu = 8
  worker_mem = 16384
  worker_count = 0
  worker_size = 25474836480

  deploy_cpu = 8
  deploy_mem = 16384
  deploy_count = 0
  deploy_size = 25474836480
}
