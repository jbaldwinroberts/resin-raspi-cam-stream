FROM resin/raspberrypi3-debian

#switch on systemd init system in container
ENV INITSYSTEM on

RUN apt-get -q update && apt-get install -yq --no-install-recommends \
	build-essential \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN gcc -o helloo hello.c

CMD ./helloo