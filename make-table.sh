#!/bin/bash

usage="$0 <dimensions> <numpointsinthds>"
# <dimensions> e.g. '3 7'

if [[ $# != 2 ]]; then
    echo "$usage" >&2
    exit 1
fi

echo "dimension numberOfPoints time timeInSeconds"

for d in $(seq $1); do
	for t in $(seq $2); do
		n=$((t*1000))
		echo -n "$d $n "
		./qhull/bin/rbox "D$d" "$n" \
		| time ./qhull/bin/qhull 2>&1 1>/dev/null \
		| awk '/elapsed/{sub(/elapsed/, "", $3); print $3}' \
		| awk -F: '{print $0 " " ($1*60 + $2)}'
	done
done
