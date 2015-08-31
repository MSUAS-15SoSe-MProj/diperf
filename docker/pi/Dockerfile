FROM resin/rpi-raspbian:wheezy
MAINTAINER Markus Boese <markus.boese@gmail.com>

# Set ENV vars
ENV HOME /home/pi
ENV GOPATH /home/pi/go_dev

# Edit PATH
ENV PATH /home/pi/pi-blaster:$PATH
ENV PATH /home/pi/go/bin:$PATH

RUN apt-get update && apt-get install -y \
        wget \
        tar \
        autotools-dev \
        automake \
        autoconf \
        make \
        apt-utils \
        git \
		pkg-config \
        gcc \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/pi/go
RUN mkdir -p /home/pi/go_dev

# Download golang 1.5 to /home/pi/go
RUN wget --no-check-certificate -qO- https://fh-muenster.sciebo.de/public.php\?service=files\&t=e30b334267184f0bc1aee4ff90d08d42\&download | tar xvz -C /home/pi/go

# Download pi-blaster for gpio control
RUN git -c http.sslVerify=false clone https://github.com/sarfata/pi-blaster.git /home/pi/pi-blaster && \
        cd /home/pi/pi-blaster && \
        ./autogen.sh && \
        ./configure && \
        make install

CMD ["pi-blaster"]

# Download go dependencies
RUN go get -d -u github.com/hybridgroup/gobot/...

# Download blink.go
RUN wget --no-check-certificate -O /home/pi/blink.go https://gist.github.com/Moddus/bb8600d28f009aeca87f

CMD ["go", "run", "/home/pi/blink.go"]

# cleanup a bit
RUN apt-get clean
RUN apt-get purge
