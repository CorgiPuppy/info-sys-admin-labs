#!/bin/bash

declare -r runtime=$1
declare endtime=$(date -d "$runtime" +%s)

declare current_folder=$PWD
declare target_folder_name=target
declare target_folder=$current_folder/$target_folder_name

declare -a dir_names=$(echo $2 | tr -d '"')
mkdir -p $target_folder/{${dir_names[0]},${dir_names[1]},${dir_names[2]}}/{${dir_names[3]},${dir_names[4]},${dir_names[5]},${dir_names[6]}}/{${dir_names[7]},${dir_names[8]},${dir_names[9]},${dir_names[10]},${dir_names[11]}};

declare target_file_name=FLAG.XYZ
declare target_file=$current_folder/$target_file_name
declare content=$(( $RANDOM % 10 ))
declare n_digits=8

for (( i=1; i<$n_digits; i++ )) {
	content+=$(( $RANDOM % 10 ))
}
echo $content > $target_file
	
while true
do
	random_depth=$(( ($RANDOM % 1) + 1 ))
	case $random_depth in
		1)
			path=$target_folder/${dir_names[$(( $RANDOM % 3 ))]}
			mv $target_file $path 2>/dev/null
			target_file=$path/$target_file_name
			;;

		2)
			path=$target_folder/${dir_names[$(( $RANDOM % 3 ))]}/${dir_names[$(( ($RANDOM % 3) + 4 ))]}
			mv $target_file $path 2>/dev/null
			target_file=$path/$target_file_name
			;;

		3)
			path=$target_folder/${dir_names[$(( $RANDOM % 3 ))]}/${dir_names[$(( ($RANDOM % 3) + 4 ))]}/${dir_names[$(( ($RANDOM % 3) + 9 ))]}
			mv $target_file $path 2>/dev/null
			target_file=$path/$target_file_name
			;;
	esac
	
	if [ $(find $target_folder -type f -name $target_file_name | wc -l) -eq 0 ]; then
		echo "File is found!"
	else
		echo "Thief file: `find $target_folder -name $target_file_name`"
	fi
	
	[[ -f $(find $target_folder -name $target_file_name) ]] && [[ $(date +%s) -le $endtime ]] || break

	sleep 1
done

find $target_folder -name $target_file_name -delete
rm -r $target_folder
