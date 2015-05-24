FROM ubuntu:14.04
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN export DEBIAN_FRONTEND="noninteractive" && \
	apt-get -qy update && \
	apt-get -qy install curl && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*