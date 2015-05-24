FROM debian:jessie
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

ENV DEBIAN_FRONTEND noninteractive

RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list) && \
    echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

RUN apt-get -q update && \
    apt-get -yq upgrade  && \
    apt-get -yq install --no-install-recommends apt-utils && \
    apt-get -yq install --no-install-recommends wget zip unzip curl locales && \
    apt-get -yq install --reinstall procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*