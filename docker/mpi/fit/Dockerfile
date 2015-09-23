FROM marbon87/mpich-arm:latest
MAINTAINER Markus Boese <markus.boese@gmail.com>

RUN apt-get update && apt-get install -y \
	cmake \
	ca-certificates \
	nfs-common \
	locales \
	build-essential \
	libpthread-stubs0-dev \
	--no-install-recommends && \
	 rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN git clone https://github.com/Moddus/pi_gpio_fit.git

WORKDIR pi_gpio_fit

RUN cmake . && make

RUN mkdir -p /mnt/nfs
RUN echo "10.0.0.1:/nfs    /mnt/nfs nfs4 rsize=8192,wsize=8192,timeo=14,intr" >> /etc/fstab

RUN useradd -p 2/wyRd6y5MCUk -G sudo -Ums /bin/bash shared 
RUN echo "//10.0.0.1/shared 	/home/shared cifs	  username=shared,pass=shared,rw" >> /etc/fstab

#fix locale
RUN locale-gen de_DE.UTF-8

# fuck up ssh for root
WORKDIR /root
RUN mkdir .ssh
WORKDIR .ssh
ADD ssh .

WORKDIR /mnt/nfs

# TODO mpirun

# cleanup a bit
RUN apt-get clean
RUN apt-get purge
