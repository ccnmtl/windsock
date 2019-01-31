all: broker windsock

broker: broker.go
	go build broker.go

windsock: windsock.go
	go build windsock.go

clean:
	rm -f broker
	rm -f windsock

install_deps:
	go get -u github.com/pebbe/zmq2
	go get -u golang.org/x/net/websocket
	go get -u github.com/Sirupsen/logrus
	go get -u github.com/kelseyhightower/envconfig

build: *.go
	docker build -f Dockerfile-broker -t ccnmtl/windsock-broker .
	docker build -f Dockerfile-windsock -t ccnmtl/windsock .

push: build
	docker push ccnmtl/windsock
	docker push ccnmtl/windsock-broker
