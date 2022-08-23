FROM ubuntu:20.04
LABEL Maintainer="Shahabaz Bagwan"

RUN  apt-get update -q

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

RUN  apt-get install -y ca-certificates

RUN  apt-get install -y \
    apt-utils \
    curl \
    wget \
    curl \
    libtool \
    libgtest-dev \
    sudo \
    git \
    build-essential \
    clang \
    xterm \
    vim \
    bash-completion \
    python \
    cmake \
    clang-format \
    tmux \
    fzf

ARG user=user
RUN useradd -ms /bin/bash $user 
RUN echo "$user:user" | chpasswd 
RUN adduser $user sudo


USER $user
ENV HOME /home/$user

RUN mkdir -p /home/$user/.fonts
COPY resources/fonts /home/${user}/.fonts
RUN fc-cache -Ev /home/${user}/.fonts

RUN mkdir -p /home/$user/repos

COPY resources/agnoster-bash /home/${user}/repos/agnoster-bash
COPY resources/fzf-tab-completion /home/${user}/repos/fzf-tab-completion
COPY resources/configs/bashrc /home/${user}/.bashrc
COPY resources/configs/tmux.conf /home/${user}/.tmux.conf

RUN curl -fLo /home/$user/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY resources/configs/vimrc /home/${user}/.vimrc


RUN mkdir -p /home/$user/projects 

CMD /bin/bash
