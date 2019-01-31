FROM golang:1.10
RUN apt-get update \
    && apt-get install pkg-config libzmq3-dev -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
ADD . /go/src/github.com/ccnmtl/windsock
WORKDIR /go/src/github.com/ccnmtl/windsock
RUN go build windsock.go
EXPOSE 5050
CMD ["/go/src/github.com/ccnmtl/windsock/windsock", "-config=/go/src/github.com/ccnmtl/windsock/windsock-docker.json"]
