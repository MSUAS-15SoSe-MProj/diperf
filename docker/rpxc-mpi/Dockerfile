FROM 	sdt4docker/raspberry-pi-cross-compiler
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#       Install packages------------------------------------------------------
RUN 	apt-get update && apt-get install -y \
        wget && \
        rm -rf /var/lib/apt/lists/*

#       Download and install mpich --------------------------------------------
#       Set ENV vars
ENV	    MPI_HOME=/usr/local/mpich

#       Create folders
RUN	    mkdir -p $MPI_HOME

#       Install MPI
RUN 	wget -qO- http://www.mpich.org/static/downloads/3.1.4/mpich-3.1.4.tar.gz | tar xz -C /tmp/ && \
        cd /tmp/mpich-3.1.4 && \
    	./configure --prefix=$MPI_HOME --disable-fortran 2>&1 -host=armv7 | tee c.txt && \
        make install 2>&1 | tee mi.txt && rm -rf /tmp/mpich-3.1.4

#       Edit PATH
ENV 	PATH=$MPI_HOME/bin:$PATH
RUN     echo "export PATH=/usr/local/mpich/bin:\$PATH" >> /etc/profile

#       cleanup a bit---------------------------------------------------------
RUN apt-get clean
RUN apt-get purge

