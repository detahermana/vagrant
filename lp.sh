#!/bin/bash

apt update -y
apt upgrade -y
apt install -y apache2 php php-mysql
apt-get install -y mysql-server
apt-get install -y unzip

cd
#wget https://github.com/sdcilsy/landing-page/archive/master.zip
wget https://github.com/detahermana/landingpage-samehada/archive/master.zip
unzip master.zip
sudo rm /var/www/html/index.html
sudo mv landingpage-samehada-master/* /var/www/html