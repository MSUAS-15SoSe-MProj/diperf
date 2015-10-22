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
            supervisor \
            gcc \
            make \
            --no-install-recommends && \
            rm -rf /var/lib/apt/lists/*

#           Create User slurm for Slurm-----------------------------------------
RUN         useradd -Ums /bin/bash slurm

#           Install Slurm--------------------------------------------------------
ENV         SLURM_VERSION slurm-15-08-1-1
WORKDIR     /tmp
RUN         wget -qO- https://github.com/SchedMD/slurm/archive/${SLURM_VERSION}.tar.gz | tar xz -C /tmp/
WORKDIR     /tmp/slurm-${SLURM_VERSION}
RUN         ./configure && make && make install

#           Setup supervisor-----------------------------------------------------
RUN         mkdir -p /var/log/supervisor && \
            mkdir -p /etc/supervisor/conf.d
ADD         supervisor.conf /etc/supervisor.conf

#           cleanup a bit---------------------------------------------------------
RUN         apt-get clean
RUN         apt-get purge

