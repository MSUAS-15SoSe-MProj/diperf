#!/bin/bash

HOME=/home/pi
GOPATH=$HOME/go_dev

# Get golang
wget -qO- https://dl.dropboxusercontent.com/u/15211215/go1.5_armv7.tar.gz | tar xvz -C $HOME
export PATH=$HOME/go/bin:$PATH


# clone udp app
mkdir -p $GOPATH
export GOPATH=$GOPATH

cd $Home
git clone https://github.com/Moddus/pi_cluster.git
