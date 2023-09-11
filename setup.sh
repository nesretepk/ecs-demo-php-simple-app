#!/bin/sh
# upgrade our system followed by update
apt-get update && apt-get -y upgrade
# install required packages for LAMP and supporting packages
apt-get install -y software-properties-common dirmngr vim net-tools sudo wget curl apt-utils awscli
apt-get install -y apache2 mysql-server
# install php and its extensions
apt-get install -y php php-mysql php-curl php-mbstring php-xml php-xmlrpc php-intl php-zip libapache2-mod-php
# connect to docker repo
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null
# start mysql and sleep for a while, so database can be created
usermod -d -y /var/lib/mysql/ mysql
echo "added?"
service mysql start &
sleep 5
# creating database for wordpress
echo "UPDATE mysql.user SET authentication_string='' WHERE user='root'" | mysql