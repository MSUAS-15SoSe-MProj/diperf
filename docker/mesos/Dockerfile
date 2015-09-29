FROM resin/rpi-raspbian:latest
MAINTAINER Markus Boese <markus.boese@gmail.com>

RUN apt-get update &&  apt-get install -y \ 
	openjdk-7-jdk \
	autoconf \
	libtool \
	build-essential \
	python-dev \
	python-boto \
	libcurl4-nss-dev \
	libsasl2-dev \
	maven \
	libapr1-dev \
	libsvn-dev \ 
	vim \
	git \
	tar \
	unzip \
	wget \
	libsasl2-modules \
	autotools-dev \
	automake \
	zlibc \
	zlib1g-dev \
	--no-install-recommends && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN  wget https://github.com/apache/mesos/archive/0.23.1.zip
RUN unzip 0.23.1.zip

WORKDIR mesos
RUN ./bootstrap
RUN mkdir build

WORKDIR build
RUN ../configure
RUN make -j 4
RUN make -j 4 check
RUN make -j 4 install

