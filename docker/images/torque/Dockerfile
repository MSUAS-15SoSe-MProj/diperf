FROM        resin/rpi-raspbian:latest
MAINTAINER  Mark Bonnekessel <marbon@mailbox.org>

#           Install packages---------------------------------------------------
RUN         apt-get update 
RUN         apt-get install -y \ 
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
            libboost-dev \
            --no-install-recommends

#           Install torque-----------------------------------------------------
ENV         TORQUE_VERSION torque-5.1.1.2-1_18e4a5f1
WORKDIR     /tmp
RUN         wget -qO- http://www.adaptivecomputing.com/index.php?wpfb_dl=2952 | tar xz -C /tmp/
WORKDIR     /tmp/${TORQUE_VERSION}
RUN         ./configure && make && make install

RUN         cp contrib/init.d/trqauthd /etc/init.d/ && \
            chkconfig --add trqauthdecho && \
            echo /usr/local/lib > /etc/ld.so.conf.d/torque.conf && \
            ldconfig && \
            /etc/init.d/trqauthd start


RUN         rm -rf /var/lib/apt/lists/*

#           cleanup a bit---------------------------------------------------------
RUN         apt-get clean
RUN         apt-get purge

