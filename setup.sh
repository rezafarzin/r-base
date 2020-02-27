#!/bin/bash

echo "Adding new R versin 3.6"
apt-get install -y software-properties-common
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

echo "Installing all required packages..."
#Install pre-requisite for R packages
apt-get update
apt-get -y upgrade
apt-get -y install curl
apt-get -y install libxml2-dev
apt-get -y install libcurl4-openssl-dev
apt-get -y install libssl-dev
apt-get -y install openjdk-8-jdk-headless
apt-get -y install curl
apt-get -y install tar
apt-get -y install vim
apt-get -y install tree
apt-get -y install apt-transport-https
apt-get -y install gnupg
apt-get -y install lsb-release
apt-get -y install wget


# from https://arrow.apache.org/install/
apt update
apt install -y -V lsb-release wget
if [ $(lsb_release --codename --short) = "stretch" ]; then
  tee /etc/apt/sources.list.d/backports.list <<APT_LINE
deb http://deb.debian.org/debian $(lsb_release --codename --short)-backports main
APT_LINE
fi
wget https://apache.bintray.com/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb
apt install -y -V ./apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb
apt update
apt install -y -V libarrow-dev # For C++
apt install -y -V libarrow-glib-dev # For GLib (C)
apt install -y -V libarrow-flight-dev # For Flight C++
apt install -y -V libplasma-dev # For Plasma C++
apt install -y -V libplasma-glib-dev # For Plasma GLib (C)
apt install -y -V libgandiva-dev # For Gandiva C++
apt install -y -V libgandiva-glib-dev # For Gandiva GLib (C)
apt install -y -V libparquet-dev # For Apache Parquet C++
apt install -y -V libparquet-glib-dev # For Apache Parquet GLib (C)


#Install R and dependecies
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export TZ=America/Los_Angeles
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ /etc/timezone
echo "Installing R BASE"
apt-get -y install tzdata
apt-get -y install r-base
echo "Install R packages"
R CMD javareconf
Rscript Packages.R
