#!/bin/bash
compose_master="$(cat $1)"
compose_slave="$(cat $2)"

master=pi1
full_cmd_master="${compose_master/HOSTNAME/$master}"
ssh $master "echo '$full_cmd_master' | docker-compose -f - up -d" &

for i in `seq 2 5`;
do
	hostname_to=pi$i
	full_cmd_slave="${compose_slave/HOSTNAME/$hostname_to}"
	ssh pi$i "echo '$full_cmd_slave' | docker-compose -f - up -d" &
done
wait
