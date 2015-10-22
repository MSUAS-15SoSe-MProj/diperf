#!/usr/bin/zsh
cmd="docker run -d --privileged -p 22222:22 -v /mnt/nfs/spark/etc/ssh:/etc/ssh --hostname=HOSTNAME-docker marbon87/rpi-spark:latest"

for i in `seq 1 5`;
do
	hostname_to=pi$i
	full_cmd="${cmd/HOSTNAME/$hostname_to}"
	ssh pi$i $full_cmd &
done
wait
