FROM golang

MAINTAINER Cleawing Dockerfile <dockerfile@cleawing.com>

# Grab and install the latest version of btcd and it's dependencies.
RUN go get -u github.com/btcsuite/btcd/...

# Expose mainnet listening port.
EXPOSE 8333

# Expose mainnet rpc port.
EXPOSE 8334

# Expose mainnet wallet rpc port.
EXPOSE 8332

# Expose testnet listening port.
EXPOSE 18333

# Expose testnet rpc port.
EXPOSE 18334

# Expose testnet wallet rpc port.
EXPOSE 18332

RUN mkdir /root/.btcd
RUN mkdir /root/.btcctl

# Generate an automatic RPC conf.
ADD initrpc.go /root/
WORKDIR /root
RUN go build -o gen-config && ./gen-config

CMD []
ENTRYPOINT ["/go/bin/btcd"]

# docker run -p 8333:8333 -d -v /home/unitymind/btcd/.btcd/:/root/.btcd/ -v /home/unitymind/btcd/.btcctl/:/root/.btcctl/ --restart=always --name btcd cleawing/btcd-go --externalip 104.197.220.70
