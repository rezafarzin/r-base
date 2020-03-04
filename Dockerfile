FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y gnupg2

ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils software-properties-common

# "Adding new R versin 3.6"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

#Install pre-requisite for R packages
RUN apt-get -y install \
    curl \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    openjdk-8-jdk-headless \
    curl \
    tar \
    vim \
    tree \
    apt-transport-https \
    gnupg \
    lsb-release \
    wget \
    python

COPY ./setup.sh /setup.sh
COPY ./Packages.R /Packages.R
RUN chmod +x setup.sh
RUN /setup.sh
RUN rm setup.sh
RUN rm Packages.R
