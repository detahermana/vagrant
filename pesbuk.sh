#!/bin/bash

DBNAME=""
DBUSER=""
DBPASS=""

apt-get update -y
apt-get upgrade -y
apt-get install -y apache2 php php-mysql
apt-get install -y mysql-server
apt-get install -y unzip

#mysql -u root -e "create user $DBUSER@'localhost' identified by '$DBPASS'; grant all privileges on *.* to $DBUSER@'localhost'"
#mysql -u root -e "create database $DBNAME"

sudo mysql -u root <<MYSQL_SCRIPT
CREATE USER '$DBUSER'@'localhost' IDENTIFIED by '$DBPASS';
GRANT ALL PRIVILEGES ON *.* to '$DBUSER'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

sudo mysql -u$DBUSER -p$DBPASS<<MYSQL_SCRIPT
CREATE DATABASE $DBNAME;
MYSQL_SCRIPT

cd
#wget https://github.com/sdcilsy/sosial-media/archive/master.zip
wget https://github.com/detahermana/pesbuk-samehada/archive/master.zip
unzip master.zip
sudo rm /var/www/html/index.html
sudo mv pesbuk-samehada-main/* /var/www/html

cd /var/www/html/
sudo mysql -u $DBUSER -p$DBPASS $DBNAME < dump.sql