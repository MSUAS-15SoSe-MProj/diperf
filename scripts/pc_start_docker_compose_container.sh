#!/bin/bash
compose="$(cat $1)"
for i in `seq 1 5`;
do
	hostname_to=pi$i
	full_cmd="${compose/HOSTNAME/$hostname_to}"
	ssh pi$i "echo '$full_cmd' | docker-compose -f - up -d" &
done
wait
