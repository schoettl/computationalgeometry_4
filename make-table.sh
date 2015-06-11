#!/bin/bash

usage="$0 <dimensions> <numpointsinthds>"
# <dimensions> e.g. '3 7'

if [[ $# != 2 ]]; then
    echo "$usage" >&2
    exit 1
fi

echo "d $(seq -s' ' $2)"

for d in $(seq $1); do
	echo -n "$d "
	for t in $(seq $2); do
		n=$((t*1000))
		./qhull/bin/rbox "D$d" "$n" \
		| time ./qhull/bin/qhull 2>&1 1>/dev/null \
		| awk 'BEGIN{ORS=" "}/elapsed/{sub(/elapsed/, "", $3); print $3}'
	done
	echo
done
