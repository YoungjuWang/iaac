### Terraform_yjwang_libvirt
---
##### ENV
~~~
- CentOS Linux release 8.2.2004 (Core) / kernel-4.18.0-193.14.2.el8_2.x86_64

- libvirtd (libvirt) 4.5.0

- Terraform v0.13.5
	+ provider registry.terraform.io/dmacvicar/libvirt v0.6.2
~~~


1 node에서 virtual network를 생성 후 해당 network를 할당한 vm을 생성하는 terraform이다.
해당 문서는 terraform에 대한 기본적인 지식이 있다는 가정 하에 기술됐다.


각 terraform 파일은 컴포넌트로 모듈로 구성돼있으며 env폴더를 생성해서 variable만 바꿔서 여러 vm들을 계속 생성해 나가는 방식으로 사용한다.
~~~
.
├── 01-addenv.sh
├── 02-create_pool_dir.sh
├── README.md
├── envs
│   ├── 00.yjwang_pool
│   │   ├── main.tf
│   │   └── terraform.tfstate
│   ├── yjwang_201117_16_54
└── modules
    ├── ceph
    ├── kubernetes
    ├── openstack
    │   ├── 00.main.tf
    │   ├── 01.domains_compute.tf
    │   ├── 01.domains_controller.tf
    │   ├── 02.networks.tf
    │   ├── 03.volumes.tf
    │   ├── 04.cloudinit.tf
    │   ├── 98.vars_compute.tf
    │   ├── 98.vars_controller.tf
    │   ├── 98.vars_general.tf
    │   ├── 98.vars_network.tf
    │   ├── 98.vars_volume.tf
    │   └── cloudinit
    │       ├── deploy_init.cfg
    │       └── network_config.cfg
    └── pool
        ├── main.tf
        └── vars.tf
~~~

### How to use

위에서 언급한 ENV와 VM 내부 network가 아닌 실제 서비스망으로 br0 (bridge)이 구성돼 있다는 전제하에 진행된다.

먼저 `01-addenv.sh`을 실행한다. 현재 git으로 다운로드된 dir 내에서 terraform을 실행하는 것으로 간주하며 env폴더를 생성해준다.
그리고 기본적으로 해당 env폴더 내에 sample.tf 파일을 복사한 main.tf가 생성되며 이를 수정하여 수행하면된다.

~~~
[root@cloud-test-6 terraform_yjwang]# ./01-addenv.sh
####################################################
Environment Home Dir will be set Current Working Dir

Current Working Dir : /home/yjwang/terraform_yjwang
####################################################
Input Environment Header Name

This name would be used in VM name
ex) header_contoller1

Input : wyj02
####################################################
합계 0
drwxr-xr-x. 3 root root 64 11월 19 10:03 00.yjwang_pool
drwxr-xr-x. 2 root root 21 11월 19 14:38 99.sample
drwxr-xr-x. 2 root root 21 11월 19 14:51 wyj02

[root@cloud-test-6 terraform_yjwang]# cat envs/wyj02/main.tf
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
~~~

이후 `02-create_pool_dir.sh`를 실행하면 libvirt 내에서 data-pool이 될 (vm들의 volume이 생성될) 폴더를 생성하고 selinux context까지 설정된다.
설정이 끝나면 `envs`폴더 내에 있는 00.yjwang_pool 폴더에 가서 pool을 생성한 다음 이후 위에서 설정한 env 경로에 가서 `main.tf`를 환경에 맞게 수정한 후 아래와 같이 진행하면 된다.

~~~
# terraform init
# terraform apply

삭제 시 
# terraform destroy
~~~
