### General
variable "servername" { type = string }

### About Mater
variable "master_cpu" { type = number }
variable "master_mem" { type = number }
variable "master_count" { type = number }
variable "master_size" { type = number }

### About Worker
variable "worker_cpu" { type = number }
variable "worker_mem" { type = number }
variable "worker_count" { type = number }
variable "worker_size" { type = number }

### About deploy
variable "deploy_cpu" { type = number }
variable "deploy_mem" { type = number }
variable "deploy_count" { type = number }
variable "deploy_size" { type = number }

### network
variable "net_deploy_name" { type = string }
variable "net_deploy" { type = string }
variable "net_deploy_address" { type = string }
variable "net_api_name" { type = string }
variable "net_api" { type = string }
variable "net_api_address" { type = string }

### pool
variable "volume_pool_name"{ type = string }
variable "volume_pool_dir" { type = string }

### image
variable "image_volume" { type = string }
