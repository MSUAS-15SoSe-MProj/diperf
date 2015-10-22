FROM 	resin/rpi-raspbian:wheezy
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#       Install packages------------------------------------------------------
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
        cifs-utils \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*

#       Download and install mpich --------------------------------------------
#       Set ENV vars
ENV	    MPI_HOME=/usr/local/mpich

#       Create folders
RUN	    mkdir -p $MPI_HOME

#       Install MPI
RUN 	wget -qO- http://www.mpich.org/static/downloads/3.1.4/mpich-3.1.4.tar.gz | tar xz -C /tmp/ && \
        cd /tmp/mpich-3.1.4 && \
    	./configure --prefix=$MPI_HOME --disable-fortran 2>&1 | tee c.txt && \
        make install 2>&1 | tee mi.txt && rm -rf /tmp/mpich-3.1.4

#       Edit PATH
ENV 	PATH=$MPI_HOME/bin:$PATH
RUN     echo "export PATH=/usr/local/mpich/bin:\$PATH" >> /etc/profile
# TODO: Allow max 20 processes per mpi-client. Increase for more
RUN     echo "export MPIR_CVAR_CH3_PORT_RANGE=40000:40020" >> /etc/profile 
#       ----------------------------------------------------------------------
#       Create supervisor directories
RUN     mkdir -p /var/log/supervisor && \
        mkdir -p /etc/supervisor/conf.d

#       Supervisor base configuration
ADD     supervisor.conf /etc/supervisor.conf
#       ----------------------------------------------------------------------
#       SSHD
RUN	    mkdir /var/run/sshd
RUN	    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ADD     ssh /root/.ssh  

RUN     echo "GlobalKnownHostsFile    /etc/ssh/global_known_hosts \n\
\n\
Host            pi*-docker, pi* \n\
    Hostname        %h \n\
    Port            22222 \n\
    IdentityFile    ~/.ssh/id_rsa \n\
    HostKeyAlias    pi-cluster-alias.local \n\
    CheckHostIP     no" >> /etc/ssh/ssh_config

RUN     for i in $( ls /etc/ssh/ssh_host*.pub ); do \
        cat $i|awk '{printf "pi-cluster-alias.local %s %s\n", $1, $2}' >> /etc/ssh/global_known_hosts;\
        done
RUN     chmod -R 600 /root/.ssh && chmod -R 644 /root/.ssh/*.pub

#       Add sshd to startup
ADD     sshd.conf /etc/supervisor/conf.d/sshd.conf
#       ----------------------------------------------------------------------
#       Call mount -a at startup
ADD     mount.conf /etc/supervisor/conf.d/mount.conf
#       ----------------------------------------------------------------------

CMD     ["supervisord", "-c", "/etc/supervisor.conf"]

#       cleanup a bit---------------------------------------------------------
RUN apt-get clean
RUN apt-get purge

