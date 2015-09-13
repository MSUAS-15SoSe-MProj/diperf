FROM 	resin/rpi-raspbian:wheezy
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

# Set ENV vars
ENV	HOME=/home/pi
ENV	MPI_HOME=/usr/local/mpich

# Create folders
RUN	mkdir -p $MPI_HOME

RUN 	apt-get update && apt-get install -y \
        wget \
        tar \
        autotools-dev \
        automake \
        autoconf \
        make \
	    libc-dev \
        gcc \
	    g++ \
        git \
        openssh-server \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*

# Download and install mpich
RUN 	wget -qO- http://www.mpich.org/static/downloads/3.1.4/mpich-3.1.4.tar.gz | tar xz -C /tmp/ && \
	cd /tmp/mpich-3.1.4 && \
	./configure --prefix=$MPI_HOME --disable-fortran 2>&1 | tee c.txt && \
	make install 2>&1 | tee mi.txt && rm -rf /tmp/mpich-3.1.4

# Edit PATH
ENV 	PATH=$MPI_HOME/bin:$PATH

# SSHD
ADD	    .ssh /root/.ssh	
RUN	    mkdir /var/run/sshd
RUN	    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

CMD	["/usr/sbin/sshd", "-D"]

# cleanup a bit
RUN apt-get clean
RUN apt-get purge

