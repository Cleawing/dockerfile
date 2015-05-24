FROM quay.io/cleawing/jre-8-oracle:latest
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

ENV MARATHON_VERSION 0.8.1

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
	DISTRO=debian && \
	CODENAME=wheezy && \
	echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | tee /etc/apt/sources.list.d/mesosphere.list && \
	apt-get -yq update && \
	apt-get -yq install --no-install-recommends mesos=0.22.1-1.0.debian78 marathon && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
	rm /etc/mesos/zk && \
    rm /etc/mesos-master/quorum
	
EXPOSE 8080