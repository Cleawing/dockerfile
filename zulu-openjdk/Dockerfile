FROM cleawing/ubuntu:14.04
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 && \
	echo "deb http://repos.azulsystems.com/ubuntu `lsb_release -cs` main" >> /etc/apt/sources.list.d/zulu.list && \
	apt-get -qy update && \
	apt-get -qy install zulu-8=8.7.0.5 && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*