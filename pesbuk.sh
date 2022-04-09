#!/bin/bash

DBNAME="dbsosmed"
DBUSER="devopscilsy"
DBPASS="1234567890"

apt-get update -y
apt-get upgrade -y
apt-get install -y apache2 php php-mysql
apt-get install -y mysql-server

mysql -u root -e "create user $DBUSER@'localhost' identified by '$DBPASS'; grant all privileges on *.* to $DBUSER@'localhost'"
mysql -u root -e "create database $DBNAME"

cd
#wget https://github.com/sdcilsy/sosial-media/archive/master.zip
wget https://github.com/detahermana/pesbuk-samehada/archive/master.zip
apt-get install -y unzip
unzip master.zip
sudo rm /var/www/html/index.html
sudo mv pesbuk-samehada-master/* /var/www/html

cd /var/www/html/
sudo mysql -u root $DBNAME < dump.sql