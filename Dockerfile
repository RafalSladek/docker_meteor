FROM ubuntu:14.04
MAINTAINER Rafal Sladek <rafal.sladek@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN sudo apt-get update && apt-get install -y nodejs
RUN adduser --disabled-login meteor_user
RUN cd ~
RUN curl https://install.meteor.com | /bin/sh
RUN meteor create --example todos
