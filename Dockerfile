FROM resin/raspberrypi3-debian

#switch on systemd init system in container
ENV INITSYSTEM on

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E1DD270288B4E6030699E45FA1715D88E1DF1F24

RUN apt-get -q update && sudo apt-get dist-upgrade && apt-get install -yq --no-install-recommends build-essential git && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN gcc -o helloo hello.c

CMD ./helloo