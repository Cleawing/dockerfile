FROM quay.io/cleawing/debian-jessie:latest
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
	DISTRO=debian && \
	CODENAME=wheezy && \
	echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | tee /etc/apt/sources.list.d/mesosphere.list && \
	apt-get -yq update && \
	apt-get -yq install --no-install-recommends mesos=0.22.1-1.0.debian78 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
	rm /etc/mesos/zk && \
    rm /etc/mesos-master/quorum