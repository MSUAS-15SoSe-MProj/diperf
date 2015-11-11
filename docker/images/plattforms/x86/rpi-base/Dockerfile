FROM 	ubuntu:wily
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
#       ----------------------------------------------------------------------

RUN     locale-gen en_US.UTF-8  
ENV     LANG en_US.UTF-8  
ENV     LANGUAGE en_US:en  
ENV     LC_ALL en_US.UTF-8  

#       ----------------------------------------------------------------------
#       Create supervisor directories
#       ----------------------------------------------------------------------

RUN     mkdir -p /var/log/supervisor && \
        mkdir -p /etc/supervisor/conf.d
ADD     supervisor.conf /etc/supervisor.conf
CMD     ["supervisord", "-c", "/etc/supervisor.conf"]

#       ----------------------------------------------------------------------
#       cleanup
#       ----------------------------------------------------------------------

RUN apt-get clean
RUN apt-get purge

