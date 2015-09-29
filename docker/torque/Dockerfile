FROM        resin/rpi-raspbian:latest
MAINTAINER  Mark Bonnekessel <marbon@mailbox.org>

RUN         apt-get update &&  apt-get install -y \ 
            vim \
            git \
            tar \
            unzip \
            wget \
            libssl-dev \
            libxml2-dev \
            ca-certificates \
            build-essential \
            libtool \
            autoconf \
            automake \
            autotools-dev \
            pkg-config \
            --no-install-recommends && \
            rm -rf /var/lib/apt/lists/*

WORKDIR     /tmp
RUN         wget -qO- https://github.com/adaptivecomputing/torque/archive/v5.1.1.tar.gz | tar xz -C /tmp/
WORKDIR     /tmp/torque-5.1.1
RUN         ./autogen.sh && ./configure && make && make install

#           cleanup a bit---------------------------------------------------------
RUN         apt-get clean
RUN         apt-get purge

