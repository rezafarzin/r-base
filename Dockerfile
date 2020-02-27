FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y gnupg2

ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils

COPY ./setup.sh /setup.sh
COPY ./Packages.R /Packages.R
RUN chmod +x setup.sh
RUN /setup.sh
RUN rm setup.sh
