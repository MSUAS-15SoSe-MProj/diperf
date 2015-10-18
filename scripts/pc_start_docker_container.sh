#!/usr/bin/zsh
cmd="docker run -d --privileged -p 22222:22 -p 40000-40020:40000-40020 --env MPIR_CVAR_CH3_PORT_RANGE=40000:40020 --hostname=HOSTNAME-docker moddus/pi_cluster_fortran:latest"

for i in `seq 1 5`;
do
	hostname_to=pi$i
	full_cmd="${cmd/HOSTNAME/$hostname_to}"
	ssh pi$i $full_cmd &
done
wait
