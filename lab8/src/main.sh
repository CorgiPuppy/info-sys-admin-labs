#!/bin/bash

declare target_file=FLAG.XYZ
declare content=$(( ($RANDOM % 10 ) + 1 ))
declare n_digits=8
declare n_rounds=3;
declare -a dirs=(a b c d e f g h i j k l)

for (( round=1; round<=$n_rounds; round++ )) {
    for (( i=1; i<$n_digits; i++ )) {
        content+=$(( $RANDOM % 10 ))
    }
    echo $content > $target_file

    mkdir -p {${dirs[0]},${dirs[1]},${dirs[2]}}/{${dirs[3]},${dirs[4]},${dirs[5]},${dirs[6]}}/{${dirs[7]},${dirs[8]},${dirs[9]},${dirs[10]},${dirs[11]}}
	case $(( ($RANDOM % 3) + 1 )) in
		1)
			mv $target_file ${dirs[$(( $RANDOM % 3 ))]}
			;;

		2)
			mv $target_file ${dirs[$(( $RANDOM % 3 ))]}/${dirs[$(( ($RANDOM % 3) + 3 ))]}
			;;

		3)
			mv $target_file ${dirs[$(( $RANDOM % 3 ))]}/${dirs[$(( ($RANDOM % 3) + 4 ))]}/${dirs[$(( ($RANDOM % 3) + 9 ))]}
			;;
	esac

    find . -type f -name "$target_file"

    rm -r {${dirs[0]},${dirs[1]},${dirs[2]}}
}
