#!/bin/bash
. include/constants.env

declare endtime=$(date -d "$runtime" +%s)

declare patrol=src/patrol.sh
declare thief=thief.sh

declare remote_dir_name="remote_directory"
declare remote_dir="$PWD/$remote_dir_name"
declare remote_home_dir="/home/corgi/git-repositories/info-sys-admin-labs/lab8/src"
declare remote_user_name="corgi"
declare remote_ip_address=10.6.64.38
sshfs $remote_user_name@$remote_ip_address:$remote_home_dir $remote_dir

bash $patrol & 
patrol_pid=$!
bash $remote_dir/$thief "$runtime" "${dir_names[@]}" &
thief_pid=$!

sleep $( cut -d " " -f 1 <<< "$runtime" ) &
wait $thief_pid

! kill -0 $thief_pid 2>/dev/null && kill $patrol_pid 2>/dev/null

sudo umount $remote_dir
