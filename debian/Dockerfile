FROM debian:jessie
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qy update && apt-get -qy upgrade \
  && apt-get -qy install apt-utils \
  && apt-get -qy install locales ca-certificates \
  && dpkg-reconfigure locales && locale-gen C.UTF-8 \
  && /usr/sbin/update-locale LANG=C.UTF-8 \
  && apt-get -qy install --no-install-recommends curl wget unzip git socat libwrap0 tcpd zip unzip \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV LC_ALL C.UTF-8
