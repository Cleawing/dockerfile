FROM cleawing/ubuntu:14.04
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF \
	&& DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]') && CODENAME=$(lsb_release -cs) \
	&& echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | tee /etc/apt/sources.list.d/mesosphere.list \
	&& apt-get -yq update && apt-get -yq install --no-install-recommends mesos=0.22.1-1.0.ubuntu1404 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
	&& rm /etc/mesos/zk && rm /etc/mesos-master/quorum