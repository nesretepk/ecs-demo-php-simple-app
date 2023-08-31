#!/bin/sh
# upgrade our system followed by update
apt-get update && apt-get -y upgrade
# install required packages for LAMP and supporting packages
apt-get install -y software-properties-common dirmngr vim net-tools sudo wget curl apt-utils awscli


