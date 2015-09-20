FROM 	resin/rpi-raspbian:wheezy
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

# Set ENV vars
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
        vim \
        iputils-ping \
        openssh-server \
        supervisor \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*

# Download and install mpich
RUN 	wget -qO- http://www.mpich.org/static/downloads/3.1.4/mpich-3.1.4.tar.gz | tar xz -C /tmp/ && \
        cd /tmp/mpich-3.1.4 && \
    	./configure --prefix=$MPI_HOME --disable-fortran 2>&1 | tee c.txt && \
        make install 2>&1 | tee mi.txt && rm -rf /tmp/mpich-3.1.4

# Edit PATH
ENV 	PATH=$MPI_HOME/bin:$PATH
RUN     echo "export PATH=/usr/local/mpich/bin:\$PATH" >> /etc/profile

# Create supervisor directories
RUN     mkdir -p /var/log/supervisor && \
        mkdir -p /etc/supervisor/conf.d

# Supervisor base configuration
ADD     supervisor.conf /etc/supervisor.conf

# SSHD
ADD	    ssh /root/.ssh	
RUN     (echo -n 'pi-cluster-alias.local ecdsa-sha2-nistp256 '; cat /etc/ssh/ssh_host_rsa_key.pub|awk '{print $2}') >> /root/.ssh/known_hosts
RUN	    mkdir /var/run/sshd
RUN	    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN     chmod -R 700 /root/.ssh && chmod -R 644 /root/.ssh/*.pub
ADD     sshd.conf /etc/supervisor/conf.d/sshd.conf

#CMD	["/usr/sbin/sshd", "-D"]
CMD     ["supervisord", "-c", "/etc/supervisor.conf"]

# cleanup a bit
RUN apt-get clean
RUN apt-get purge

