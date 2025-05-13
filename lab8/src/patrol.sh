#!/bin/bash
. include/constants.env

declare endtime=$(date -d "$runtime" +%s)

declare current_folder=$PWD

declare safe_dir_name=$safe_dir_name
declare safe_dir=$current_folder/$safe_dir_name
mkdir $safe_dir 2>/dev/null

declare target_folder_name=target
declare target_folder=$current_folder/$target_folder_name

declare -a dir_names=$dir_names

declare target_file_name=FLAG.XYZ

while [[ $(date +%s) -le $endtime ]]
do
	random_depth=$(( ($RANDOM % 3) + 1 ))
	case $random_depth in
		1)
			path=$target_folder/${dir_names[$(( $RANDOM % 3 ))]}
			echo "Patrol path: $path"
			path_file=`find $path -maxdepth 1 -name $target_file_name 2>/dev/null`
			test -f $path_file && mv $path_file $safe_dir 2>/dev/null
			;;

		2)
			path=$target_folder/${dir_names[$(( $RANDOM % 3 ))]}/${dir_names[$(( ($RANDOM % 3) + 4 ))]}
			echo "Patrol path: $path"
			path_file=`find $path -maxdepth 1 -name $target_file_name 2>/dev/null`
			test -f $path_file || mv $path_file $safe_dir 2>/dev/null
			;;

		3)
			path=$target_folder/${dir_names[$(( $RANDOM % 3 ))]}/${dir_names[$(( ($RANDOM % 3) + 4 ))]}/${dir_names[$(( ($RANDOM % 3) + 9 ))]}
			echo "Patrol path: $path"
			path_file=`find $path -maxdepth 1 -name $target_file_name 2>/dev/null`
			test -f $path_file || mv $path_file $safe_dir 2>/dev/null
			;;
	esac

	if test -f $safe_dir/$target_file_name
	then
		echo "Content of a found file $target_file_name: `cat $safe_dir/$target_file_name`";
		break
	fi

	sleep 1
done
