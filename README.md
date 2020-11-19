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

