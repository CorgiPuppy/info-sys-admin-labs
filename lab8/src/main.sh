#!/bin/bash
. include/constants.env

declare endtime=$(date -d "$runtime" +%s)

declare patrol=src/patrol.sh
declare thief=thief.sh
#declare thief=src/thief.sh

declare remote_dir_name="remote_directory"
declare remote_dir="$PWD/$remote_dir_name"
declare remote_user_name="corgi"
declare remote_home_dir="/home/$remote_user_name/git-repositories/info-sys-admin-labs/lab8/src"
declare remote_ip_address="192.168.43.25"
sshfs $remote_user_name@$remote_ip_address:$remote_home_dir $remote_dir

declare safe_dir=$PWD/$safe_dir_name
declare target_file_name="FLAG.XYZ"

declare counter_patrol=0
declare counter_thief=0
declare amount_of_rounds=3
for (( i=1; i<=$amount_of_rounds; i++ ))
do
	echo "Round: $i."

	if [[ $i%2 -ne 0 ]]
	then
		bash $patrol & 
		patrol_pid=$!
		bash $remote_dir/$thief "$runtime" "${dir_names[@]}" &
		#bash $thief "$runtime" "${dir_names[@]}" &
		thief_pid=$!
	else
		bash $remote_dir/$thief "$runtime" "${dir_names[@]}" &
		#bash $thief "$runtime" "${dir_names[@]}" &
		thief_pid=$!
		bash $patrol & 
		patrol_pid=$!
	fi

	sleep $( cut -d " " -f 1 <<< "$runtime" ) &
	wait $thief_pid

	! kill -0 $thief_pid 2>/dev/null && kill $patrol_pid 2>/dev/null

	if test -f $safe_dir/$target_file_name
	then
		(( counter_patrol++ ))
		rm $safe_dir/$target_file_name
	else
		(( counter_thief++ ))
	fi

	echo "Scores:"
	echo -e "\tPatrol: $counter_patrol"
	echo -e "\tThief: $counter_thief"

	rmdir $safe_dir
done

sudo umount $remote_dir
