#!/bin/bash

mount -a
exec inotifywait -m "/root/mnt"
