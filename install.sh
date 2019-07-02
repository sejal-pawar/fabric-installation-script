#!/bin/bash

#CONFIGURE CURL WITH SSL
sudo apt-get update
sudo apt install gcc make binutils python libssl-dev docker.io docker-compose
wget https://curl.haxx.se/download/curl-7.64.0.tar.gz
tar -xvsf curl*.tar.gz
cd curl-7.64.0
./configure --with-ssl
make
sudo make install
sudo ldconfig
curl --version

#SETUP DOCKER WITHOUT SUDO
sudo usermod -aG docker ${USER}

#INSTALL GOLANG
cd $HOME
wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
tar xpzf go1.11.5.linux-amd64.tar.gz
sudo cp -r go /usr/local/
cat << EOF >> ~/.profile
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
EOF
source ~/.profile
go version

#VERIFY DOCKER IS INSTALLED
su - $USER
docker version
docker-compose version

#INSTALL FABRIC BINARIES
curl -sSL http://bit.ly/2ysbOFE | bash -s 1.4.0
