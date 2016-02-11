# Ubuntu with the latest golang installed

# Installs via godeb

FROM ubuntu:latest
MAINTAINER hugo@palletops.com
ENV GOPATH /usr/local/lib/go
RUN apt-get -y update --no-install-recommends
RUN apt-get -y install --no-install-recommends golang-go bzr git ca-certificates
RUN go get gopkg.in/niemeyer/godeb.v1/cmd/godeb
RUN /usr/local/lib/go/bin/godeb --help
RUN apt-get -y remove golang-go
RUN apt-get -y autoremove
RUN /usr/local/lib/go/bin/godeb install
RUN rm -rf $GOPATH
RUN rm *.deb
RUN apt-get -y remove bzr git ca-certificates
RUN apt-get -y autoremove
RUN apt-get -y autoclean
RUN apt-get -y clean
RUN go version