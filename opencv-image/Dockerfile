FROM ubuntu:20.04

LABEL maintainer="Shahabaz Bagwan"
LABEL version="0.1"
LABEL description="This image is for opencv 4.4 with contrib module"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y

ENV TZ="Europe/Berlin"
RUN apt install -y tzdata

RUN apt install -y build-essential cmake git pkg-config libgtk-3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev python3-dev python3-numpy \
    libtbb2 libtbb-dev libdc1394-dev libopenexr-dev \
    libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
    

RUN mkdir ~/opencv_build && cd ~/opencv_build && \
git clone --depth 1 --branch 4.4.0 https://github.com/opencv/opencv.git && \
git clone --depth 1 --branch 4.4.0 https://github.com/opencv/opencv_contrib.git

RUN cd ~/opencv_build/opencv && \
mkdir -p build && cd build


RUN cmake -S ~/opencv_build/opencv -B ~/opencv_build/opencv/build -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON ..
 
RUN cd ~/opencv_build/opencv/build && make -j8

RUN cd ~/opencv_build/opencv/build && make install
