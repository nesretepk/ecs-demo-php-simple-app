#!/bin/sh
# upgrade our system followed by update
apt-get update && apt-get -y upgrade
# install required packages for LAMP and supporting packages
apt-get install -y software-properties-common dirmngr vim net-tools sudo wget curl apt-utils awscli



# add repo for ubuntu:latest
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty stable"

# connect to docker repo

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null
#install apache and mysql
apt-get install -y apache2 mysql-server
# install php and its extensions
apt-get install -y php8.2 php8.2-mysql php8.2-curl php8.2-gd php8.2-mbstring php8.2-xml php8.2-xmlrpc php8.2-intl php8.2-zip libapache2-mod-php8.2
# start mysql and sleep for a while, so database can be created
usermod -d -y /var/lib/mysql/ mysql
echo "added?"
service mysql start &
sleep 5
# creating database for wordpress
echo "UPDATE mysql.user SET authentication_string='' WHERE user='root'" | mysql