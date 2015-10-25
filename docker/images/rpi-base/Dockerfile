FROM 	resin/rpi-raspbian:wheezy
MAINTAINER Mark Bonnekessel <marbon@mailbox.org>

#       Install packages------------------------------------------------------
RUN 	apt-get update && apt-get install -y \
        ca-certificates \
        locales \
        wget \
        tar \
        vim \
        iputils-ping \
        supervisor \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*

#       ----------------------------------------------------------------------
#       set locale
RUN     locale-gen en_EN.UTF-8
#       ----------------------------------------------------------------------
#       Create supervisor directories
RUN     mkdir -p /var/log/supervisor && \
        mkdir -p /etc/supervisor/conf.d

#       Supervisor base configuration
ADD     supervisor.conf /etc/supervisor.conf
#       ----------------------------------------------------------------------

CMD     ["supervisord", "-c", "/etc/supervisor.conf"]

#       cleanup a bit---------------------------------------------------------
RUN apt-get clean
RUN apt-get purge

