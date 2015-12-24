FROM cleawing/debian
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN apt-get -qy update && apt-get -qy upgrade \
  && apt-get -qy install build-essential autoconf libncurses5 libncurses5-dev libssl-dev htop mc net-tools \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
