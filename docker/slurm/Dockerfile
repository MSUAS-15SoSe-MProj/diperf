FROM        resin/rpi-raspbian:latest
MAINTAINER  Mark Bonnekessel <marbon@mailbox.org>

#           Install packages---------------------------------------------------
RUN         apt-get update 
#           TODO: merge package installation and cleanup
RUN         apt-get install -y \ 
            vim \
            git \
            tar \
            wget \
            libssl-dev \
            ca-certificates \
            autoconf \
            automake \
            autotools-dev \
            pkg-config \
            python \
            --no-install-recommends

#           Install torque-----------------------------------------------------
ENV         SLURM_VERSION slurm-15-08-1-1
WORKDIR     /tmp
RUN         wget -qO- https://github.com/SchedMD/slurm/archive/${SLURM_VERSION}.tar.gz | tar xz -C /tmp/
WORKDIR     /tmp/slurm-${SLURM_VERSION}
RUN         apt-get install -y gcc
RUN         apt-get install -y make
RUN         ./configure && make && make install



RUN         rm -rf /var/lib/apt/lists/*

#           cleanup a bit---------------------------------------------------------
RUN         apt-get clean
RUN         apt-get purge

