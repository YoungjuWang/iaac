module "kubernetes_module" {
  source = "../../modules/kubernetes"

### General
  servername = "wyj00"

### Volume
  volume_pool_name = "yjwang_pool"
  volume_pool_dir = "/data/yjwang_pool"
  image_volume = "/usr/vm-template/CentOS-8.2.qcow2"

### Netowrk
  net_deploy_name = "wyj_k8s_deploy0"
  net_deploy = "10.98.90.0/24"
  net_deploy_address = "10.98.90"

  net_api_name = "wyj_k8s_api0"
  net_api = "10.98.62.0/24"
  net_api_address = "10.98.62"

### About Nodes
  master_count = 2
  master_size = 45474836480
  master_mem = 16384
  master_cpu = 8

  worker_count = 3
  worker_size = 45474836480
  worker_mem = 16384
  worker_cpu = 8

  deploy_count = 1
  deploy_size = 25474836480
  deploy_mem = 16384
  deploy_cpu = 8
}
