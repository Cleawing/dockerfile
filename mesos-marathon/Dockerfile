FROM cleawing/zulu-openjdk:8u45

MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN export MARATHON_VERSION="0.8.2" && apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
	DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]') && \
	CODENAME=$(lsb_release -cs) && \
	echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | tee /etc/apt/sources.list.d/mesosphere.list && \
	apt-get -yq update && \
	apt-get -yq install --no-install-recommends mesos=0.22.1-1.0.ubuntu1404 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
	rm /etc/mesos/zk && \
    rm /etc/mesos-master/quorum && \
	curl -L -o /tmp/marathon.tgz https://downloads.mesosphere.io/marathon/v${MARATHON_VERSION}/marathon-${MARATHON_VERSION}.tgz && \
	mkdir -p /opt/marathon && tar xzf /tmp/marathon.tgz -C /opt/marathon --strip=1 && rm -f /tmp/marathon.tgz

WORKDIR /opt/marathon	

EXPOSE 8080

CMD ["--help"]
ENTRYPOINT ["./bin/start"]