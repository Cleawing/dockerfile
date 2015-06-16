FROM cleawing/debian:jessie
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN echo 'deb http://httpredir.debian.org/debian jessie contrib' >> /etc/apt/sources.list \
	&& echo 'deb http://download.gluster.org/pub/gluster/glusterfs/3.7/3.7.1/Debian/jessie/apt jessie main' > /etc/apt/sources.list.d/gluster.list \
	&& wget -O - http://download.gluster.org/pub/gluster/glusterfs/3.7/3.7.1/Debian/jessie/pub.key | apt-key add - \
	&& apt-get -q update \
	&& apt-get -qy install glusterfs-server=3.7.1-1 \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME ["/data", "/var/lib/glusterd"]
EXPOSE 111 111/udp 24007 24009 49152
CMD ["/usr/sbin/glusterd","-N"]