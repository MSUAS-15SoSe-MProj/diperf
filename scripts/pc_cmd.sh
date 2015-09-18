#!/bin/bash
for i in `seq 1 5`;
do
	echo pi$i
	ssh pi$i	$1
done
