#!/bin/bash
for i in `seq 1 5`;
do
	ssh pi$i	"docker run -d --privileged -p 22222:22 -p 40000-40100:40000-40100 --env MPIR_CVAR_CH3_PORT_RANGE=40000:40100 --hostname=$HOSTNAME-docker-container moddus/fit:latest" &
done
wait
