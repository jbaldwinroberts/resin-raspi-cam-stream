FROM resin/raspberrypi3-debian

ENV INITSYSTEM on

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E1DD270288B4E6030699E45FA1715D88E1DF1F24
RUN apt-get -q update && sudo apt-get dist-upgrade && apt-get install -yq --no-install-recommends build-essential git && apt-get clean 

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/silvanmelchior/RPi_Cam_Web_Interface.git
WORKDIR /usr/src/app/RPi_Cam_Web_Interface
RUN chmod u+x *.sh
RUN ./install.sh q

#TODO Figure out how to disable auto-start on boot
#TODO Power cycle needed x 2 - figure out why and write a script to automate
#Enable public URL

CMD modprobe bcm2835-v4l2 && ./start.sh