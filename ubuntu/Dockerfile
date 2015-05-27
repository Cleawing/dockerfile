FROM ubuntu:14.04
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.en
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qy update && apt-get -qy upgrade \
	&& apt-get -qy install curl wget attr software-properties-common psmisc \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*