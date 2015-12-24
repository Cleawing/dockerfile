FROM cleawing/debian

MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

RUN echo "deb http://packages.erlang-solutions.com/debian jessie contrib" | tee /etc/apt/sources.list.d/erlang.list \
  && wget http://packages.erlang-solutions.com/debian/erlang_solutions.asc && apt-key add erlang_solutions.asc && rm erlang_solutions.asc \
  && apt-get update && apt-get -yq install esl-erlang \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
