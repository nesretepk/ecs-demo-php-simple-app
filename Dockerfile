FROM ubuntu:latest
# disable package prompt interaction
ENV DEBIAN_FRONTEND noninteractive
# install required packages
ADD ./setup.sh /setup.sh
