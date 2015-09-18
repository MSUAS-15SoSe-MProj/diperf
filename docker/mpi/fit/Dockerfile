FROM marbon87/mpich-arm:latest
MAINTAINER Markus Boese <markus.boese@gmail.com>


RUN apt-get update && apt-get install -y \
	cmake \
	g++ \
	ca-certificates \
	smbclient \
	cifs-utils \
	nfs-common \
	vim \
	iputils-ping \
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
RUN echo "10.0.0.1:/nfs /root/mnt nfs4 auto,rsize=8192,wsize=8192,timeo=14,intr" >> /etc/fstab
ADD nfs-common /etc/defaults/nfs-common
RUN /etc/init.d/nfs-common start
#ADD .smbcredentials /root/.smbcredentials
#RUN echo "//10.0.0.1/picluster /root/mnt cifs noauto,users,credentials=/root/.smbcredentials  0 0" >> /etc/fstab

RUN /etc/init.d/rpcbind start

RUN mount -a


# TODO mpirun

# cleanup a bit
#RUN apt-get clean
#RUN apt-get purge
