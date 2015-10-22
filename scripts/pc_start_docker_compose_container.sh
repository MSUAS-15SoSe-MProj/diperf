#!/bin/bash
compose="$(cat -e $1 | sed 's/\\$/\\n/g')"

for i in `seq 1 5`;
do
	hostname_to=pi$i
	full_cmd="${compose/HOSTNAME/$hostname_to}"
    ssh pi$i "echo $full_cmd | docker-compose -f - up -d" &
done
wait
