FROM cleawing/debian-devel
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

ENV JDK_VERSION 1.8.0_60
ENV JAVA_HOME /usr/local/jdk${JDK_VERSION}

WORKDIR /usr/local

RUN (wget -q -O - \
    --no-check-certificate --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz | \
    tar --no-same-owner -xzf - ) && \
  (cd /tmp && \
   wget -q --no-check-certificate --no-cookies \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip && \
   unzip -oj -d ${JAVA_HOME}/jre/lib/security jce_policy-8.zip \*/\*.jar && \
   rm jce_policy-8.zip)

ENV PATH $JAVA_HOME/bin:$PATH

WORKDIR /root
