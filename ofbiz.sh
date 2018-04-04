#!/usr/bin/env bash
# Run as sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
export DEBIAN_FRONTEND=noninteractive
apt install -y software-properties-common wget unzip net-tools
add-apt-repository -y ppa:webupd8team/java
apt update -y
apt install -y oracle-java8-installer
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
source ~/.bashrc
# Start Ofbiz
wget http://mirror.dsrg.utoronto.ca/apache/ofbiz/apache-ofbiz-16.11.04.zip
unzip apache-ofbiz-16.11.04.zip
cd apache-ofbiz-16.11.04
time ./gradlew cleanAll loadDefault
./gradlew 'ofbizBackground --start'
