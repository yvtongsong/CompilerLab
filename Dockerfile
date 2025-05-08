FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN \
  sed -i -e "s%http://[^ ]\+%http://mirrors.tuna.tsinghua.edu.cn/ubuntu/%g" /etc/apt/sources.list && \
  apt-get update -y && \
  apt-get upgrade -y && \
  apt-get -y --no-install-recommends install \
  	gcc make flex bison vim && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/* && \
  echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY lab3/ /home/

CMD ["/bin/bash", "-l"]
