#! /bin/bash
echo "####################################################"
echo "Environment Home Dir will be set Current Working Dir"
echo ""
echo "Current Working Dir : $(pwd)"
home_dir=$(pwd)
echo "####################################################"

echo "Input Environment Header Name"
echo ""
echo "This name would be used in VM name"
echo "ex) header_contoller1"
echo ""
echo -n "Input : "
read env_name
echo "####################################################"

mkdir -p "$home_dir/envs/$env_name"
cp -rp $home_dir/envs/99.sample/* $home_dir/envs/$env_name

ls -l "$home_dir/envs/"
