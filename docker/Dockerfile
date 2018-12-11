FROM ubuntu:16.04

ENV LC_ALL=C.UTF-8

# Install packages additional Ubuntu PPAs.
RUN apt-get update -y && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:election-geodata/ppa

# Install needed binary packages.
RUN apt-get update -y && \
    apt-get install -y libgeos-c1v5=3.5.1-3~xenial0 gdal-bin=2.2.2+dfsg-1~xenial1 && \
    apt-get install -y python-mapnik python-pip imagemagick && \
    apt-get install -y build-essential zip unzip awscli git && \
    pip install requests uritemplate

# Install scripts
COPY update-github.py /usr/local/bin/update-github.py
COPY build-publish.sh /usr/local/bin/build-publish.sh

# Build and publish (if possible)
CMD /usr/local/bin/build-publish.sh
