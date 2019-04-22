#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2016,
# Description : Installing Docker on Ubuntu.

# Note: Please run this script with sudo privilage.

# uninstalling old versions of docker.
apt -y remove docker docker-engine docker.io

# updating packages index.
apt update

# upgrading packages.
apt -y upgrade

# dist upgrading package.
apt -y dist-upgrade

# installing packages to allow apt to use repository over https.
apt -y install apt-transport-https \
               ca-certificates     \
               curl                \
               software-properties-common

# adding docker official gpg key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# setting up the stable docker repository.
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# updating apt package index.
apt update

# installing latest version of docker ce.
apt -y install docker-ce docker-ce-cli containerd.io

# extracting "webapp" tar ball and removing.
tar xzf $HOME/tomcat-8.5.40/webapp.tar.gz -C $HOME/tomcat-8.5.40/ && rm $HOME/tomcat-8.5.40/webapp.tar.gz

# pulling tomcat:8.5.40 image from docker hub.
docker pull balajipothula/tomcat:8.5.40

# running docker container with name(--name) "tomcat" as daemon(-d),
# stdin(-i) with volume(-v) "webapp" on port(-p) "8080".
docker run --name tomcat -d -i -p 8080:8080 --privileged -v $HOME/tomcat-8.5.40/webapp:/webapp balajipothula/tomcat:8.5.40 sh

# executing docker container by name with stdin(-i), starting tomcat server.
docker exec -i tomcat /webapp/tomcat/bin/startup.sh
