########################
##  git clone https://github.com/harryliu123/docker-learn.git
##  cd docker-learn
##  docker build -t helloworld:v1 . --no-cache -f Dockerfile-1
##  docker run -it -d -p 8081:8080 helloworld:v1
##  http://127.0.0.1:8081/ping  會出現  Hello World
########################

FROM golang:1.11.2-alpine
MAINTAINER harry
WORKDIR /helloworld-go
ADD . /helloworld-go
RUN cd /helloworld-go && \
    go build helloworld-go/helloworld.go

VOLUME ["/var/log/"]
EXPOSE 8080
ENTRYPOINT /helloworld-go/helloworld
