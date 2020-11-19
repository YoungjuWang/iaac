#! /bin/bash

echo -n "Input Environment Home Dir : "
read home_dir

echo "Input Environment Header Name"
echo "This name would be used in VM name"
echo "ex) header_contoller1"
echo -n "Input : "
read env_name

mkdir -p "$home_dir/$env_name"

ls -l "$home_dir"
