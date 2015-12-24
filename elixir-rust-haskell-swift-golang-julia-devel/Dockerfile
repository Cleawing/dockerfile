FROM cleawing/haskell
MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /root

RUN apt-get update && apt-get -qy upgrade \
    && apt-get -qy install apt-utils \
    && apt-get -qy install locales ca-certificates \
    && dpkg-reconfigure locales && locale-gen C.UTF-8 \
    && /usr/sbin/update-locale LANG=C.UTF-8 \
    && apt-get -qy install curl wget git zip unzip g++ gcc libc6-dev make \
       build-essential autoconf libncurses5 libncurses5-dev libssl-dev htop mc net-tools file strace \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV LC_ALL C.UTF-8

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb \
    && rm erlang-solutions_1.0_all.deb && wget http://packages.erlang-solutions.com/debian/erlang_solutions.asc \
    && apt-key add erlang_solutions.asc && rm erlang_solutions.asc \
    && apt-get update && apt-get -qy install esl-erlang elixir \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD https://s3.amazonaws.com/rebar3/rebar3 /usr/local/bin/rebar3
ADD rebar.config /root/.config/rebar3/rebar.config
RUN chmod +x /usr/local/bin/rebar3
RUN /usr/local/bin/rebar3 update && /usr/local/bin/rebar3 plugins upgrade rebar3_hex

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --disable-sudo --yes

RUN wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/debian/fpco.key | apt-key add -
RUN echo 'deb http://download.fpcomplete.com/debian/jessie stable main' | tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update && apt-get -qy install stack \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

ENV SWIFT_VERSION 2.2-SNAPSHOT-2015-12-22-a
ENV SWIFT_PLATFORM ubuntu14.04

RUN apt-get update && apt-get -qy install libxml2 libxml2-dev clang libedit-dev python2.7 python2.7-dev libicu52 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
RUN gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

RUN wget https://swift.org/builds/ubuntu1404/swift-$SWIFT_VERSION/swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz && \
    wget https://swift.org/builds/ubuntu1404/swift-$SWIFT_VERSION/swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz.sig && \
    gpg --verify swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz.sig && \
    tar xzf swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz && \
    rm swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz swift-$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz.sig

ENV PATH /opt/swift-$SWIFT_VERSION-$SWIFT_PLATFORM/usr/bin:"${PATH}"

WORKDIR /root

ENV GOLANG_VERSION 1.5.2
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA1 cae87ed095e8d94a81871281d35da7829bd1234e

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
  && echo "$GOLANG_DOWNLOAD_SHA1  golang.tar.gz" | sha1sum -c - \
  && tar -C /usr/local -xzf golang.tar.gz \
  && rm golang.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

COPY go-wrapper /usr/local/bin/

# http://julialang.org/juliareleases.asc
# Julia (Binary signing key) <buildbot@julialang.org>
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 3673DF529D9049477F76B37566E3C7DC03D6E495

ENV JULIA_PATH /usr/local/julia
ENV JULIA_VERSION 0.4.2

RUN mkdir $JULIA_PATH \
  && apt-get -qy update && apt-get -qy install  llvm \
  && curl -sSL "https://julialang.s3.amazonaws.com/bin/linux/x64/${JULIA_VERSION%[.-]*}/julia-${JULIA_VERSION}-linux-x86_64.tar.gz" -o julia.tar.gz \
  && curl -sSL "https://julialang.s3.amazonaws.com/bin/linux/x64/${JULIA_VERSION%[.-]*}/julia-${JULIA_VERSION}-linux-x86_64.tar.gz.asc" -o julia.tar.gz.asc \
  && gpg --verify julia.tar.gz.asc \
  && tar -xzf julia.tar.gz -C $JULIA_PATH --strip-components 1 \
  && apt-get clean && rm -rf /var/lib/apt/lists/* julia.tar.gz*

ENV PATH $JULIA_PATH/bin:$PATH

CMD ["bash"]
