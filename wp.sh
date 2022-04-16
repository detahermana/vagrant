#/bin/sh

DBUSER=""
DBPASS=""
DBNAME=""

#Persiapan installasi
apt-get update -y
apt-get upgrade -y
apt-get install -y unzip
apt-get install -y apache2 php php-mysql
apt-get install -y mysql-server
apt-get install -y php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php7.4-cli

#download wordpress
cd /tmp
#wget https://wordpress.org/latest.zip
wget https://github.com/detahermana/wordpress-samehada/archive/master.zip
unzip master.zip
sudo rm /var/www/html/index.html
sudo mv wordpress-samehada-main/* /var/www/html
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

#set up user & database
sudo mysql -u root <<MYSQL_SCRIPT
CREATE USER '$DBUSER'@'localhost' IDENTIFIED by '$DBPASS';
GRANT ALL PRIVILEGES ON *.* to '$DBUSER'@'localhost';
FLUSH PRIVILEGES;
create database $DBNAME default character set utf8 COLLATE utf8_unicode_ci;
MYSQL_SCRIPT

#setting wordpress
sudo chown -R www-data:www-data /var/www/html
cd /var/www/html/
touch .htaccess
curl -s [https://api.wordpress.org/secret-key/1.1/salt/

#setting permission
sudo find /var/www/html/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/ -type f -exec chmod 640 {} \;

#setting database
sudo sed -i "s/database_name_here/$DBNAME/1" /var/www/html/wp-config.php
sudo sed -i "s/password_here/$DBPASS/1" /var/www/html/wp-config.php
sudo sed -i "s/username_here/$DBUSER/1" /var/www/html/wp-config.php
rm -rf /tmp/wordpress-samehada-main

systemctl restart apache2