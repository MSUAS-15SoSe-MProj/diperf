FROM marbon87/mpich-arm:latest
MAINTAINER Markus Boese <markus.boese@gmail.com>


RUN apt-get update && apt-get install -y \
	cmake \
	g++ \
	ca-certificates \
	build-essential \
	libpthread-stubs0-dev \
	--no-install-recommends && \
	 rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN git clone https://github.com/Moddus/pi_gpio_fit.git

WORKDIR pi_gpio_fit

RUN cmake . && make

# TODO mpirun
