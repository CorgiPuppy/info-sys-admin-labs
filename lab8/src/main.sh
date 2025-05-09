#!/bin/bash
. include/constants.env

declare endtime=$(date -d "$runtime" +%s)

declare patrol=src/patrol.sh
declare thief=src/thief.sh

bash $patrol & 
patrol_pid=$!
bash $thief "$runtime" "${dir_names[@]}" &
thief_pid=$!

sleep $( cut -d " " -f 1 <<< "$runtime" ) &
wait $thief_pid

! kill -0 $thief_pid 2>/dev/null && kill $patrol_pid 2>/dev/null
