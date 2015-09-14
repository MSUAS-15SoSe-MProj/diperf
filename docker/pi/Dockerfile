FROM resin/rpi-raspbian:wheezy
MAINTAINER Markus Boese <markus.boese@gmail.com>

RUN mkdir -p /home/pi

# Set ENV vars
ENV HOME=/home/pi
ENV GO=/home/pi/go
ENV GOPATH=/home/pi/go_dev
ENV GOROOT=/home/pi/go

# Edit PATH
ENV PATH=/home/pi/pi-blaster:$PATH
ENV PATH=/home/pi/go/bin:$PATH

RUN touch /home/pi/.bashrc
RUN echo "export PATH=$PATH" > /home/pi/.bashrc
RUN echo $PATH

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
		libc-dev \
        gcc \
		nfs-common \
		ca-certificates \
		vim \
		iputils-ping \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*



# RUN mkdir -p $GO
RUN mkdir -p $GOPATH

# Download golang 1.5 to /home/pi/go
RUN wget -qO- https://dl.dropboxusercontent.com/u/15211215/go1.5_armv7.tar.gz | tar xvz -C $HOME

# Download pi-blaster for gpio control
RUN git clone https://github.com/sarfata/pi-blaster.git $HOME/pi-blaster && \
        cd $HOME/pi-blaster && \
        ./autogen.sh && \
        ./configure && \
        make install

CMD ["pi-blaster"]

# Download go dependencies
RUN go get -d -u golang.org/x/net/websocket
RUN go get -d -u github.com/hybridgroup/gobot/...

# Download blink.go
RUN wget -O $HOME/blink.go https://gist.githubusercontent.com/Moddus/bb8600d28f009aeca87f/raw/dc98a6182b3ed3be63c1f6896c23437dfb2bec2e/blink.go

CMD ["go", "run", "/home/pi/blink.go"]

RUN mkdir -p /home/pi/mnt
RUN echo "10.0.0.1:/export/nfs    /home/pi/mnt nfs rsize=8192,wsize=8192,timeo=14,intr" >> /etc/fstab

# cleanup a bit
RUN apt-get clean
RUN apt-get purge
