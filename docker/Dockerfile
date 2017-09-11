FROM ubuntu:14.04

ENV LC_ALL=C.UTF-8

# Install packages additional Ubuntu PPAs.
RUN apt-get update -y && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:migurski/electionsgeodata

# Install needed binary packages.
RUN apt-get update -y && \
    apt-get install -y libgeos-c1v5=3.5.0-1~trusty1 gdal-bin=2.1.0+dfsg-1~trusty2 && \
    apt-get install -y python-mapnik python-requests imagemagick
