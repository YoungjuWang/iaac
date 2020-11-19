#!/bin/bash

echo -n "Input pool dir path : "
read dirpath

export $dirpath

mkdir -p $dirpath
semanage fcontext -a -t virt_image_t $dirpath
restorecon -Rvv $dirpath

ls -ldZ $dirpath
ls -l $dirpath
