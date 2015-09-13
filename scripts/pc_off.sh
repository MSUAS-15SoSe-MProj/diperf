#!/bin/bash
for i in `seq 1 5`;
do
	ssh pi$i "sudo poweroff"
done
