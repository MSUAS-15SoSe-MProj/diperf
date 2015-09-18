FROM marbon87/mpich-arm:latest
MAINTAINER Markus Boese <markus.boese@gmail.com>

RUN apt-get update && apt-get install -y \
	cmake \
	ca-certificates \
	nfs-common \
	build-essential \
	libpthread-stubs0-dev \
	--no-install-recommends && \
	 rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN git clone https://github.com/Moddus/pi_gpio_fit.git

WORKDIR pi_gpio_fit

RUN cmake . && make

RUN mkdir -p /root/mnt
WORKDIR /root/mnt
RUN echo "10.0.0.1:/nfs    /root/mnt nfs4 rsize=8192,wsize=8192,timeo=14,intr" >> /etc/fstab

ADD mount.conf /etc/supervisor/conf.d/mount.conf

# TODO mpirun

# cleanup a bit
RUN apt-get clean
RUN apt-get purge
