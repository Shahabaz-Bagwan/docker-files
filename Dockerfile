FROM alpine:latest

MAINTAINER "Shahabaz Bagwan"

RUN apk update && apk upgrade

ENV TZ=Europe/Berlin

RUN apk add \
    bash \
    bash-completion \
    tzdata \
    openssl \
    wget \
    curl \
    tree \
    neovim \
    git \
    htop \
    cmake \
    clang \
    g++ \
    fzf \
    tmux \
    python3 \
    openssh \
    automake \
    autoconf 
    
RUN mkdir $HOME/projects

CMD /bin/bash

