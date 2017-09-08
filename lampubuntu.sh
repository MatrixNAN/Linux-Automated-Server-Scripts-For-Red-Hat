#!/bin/bash

# This installs our LAMP Setup
sudo apt-get install apache2
sudo apt-get install mysql-server
sudo apt-get install mysql
sudo apt-get install php5
sudo apt-get install php5-gd
sudo apt-get install php5-pear
sudo apt-get install php5-mysql
sudo apt-get install php5-xml
sudo apt-get install php5-common
sudo apt-get install php5-mcrypt
sudo apt-get install php5-mhash
sudo apt-get install phpmyadmin

# Python Web Development Server
sudo apt-get install python

#==================================
# Starting Servers
#==================================

# Starting Apache Server
sudo service apache2 start

# Starting MySQL Server
sudo service mysql start

mkdir /var/www/localhost
mkdir /var/www/localhost/html

echo "<?php phpinfo(); ?>" > /var/www/localhost/html/info.php

echo "<VirtualHost *:80>" >> /etc/httpd/conf/httpd.conf
echo "ServerAdmin webmaster@localhost" >> /etc/httpd/conf/httpd.conf
echo "DocumentRoot /var/www/localhost/html" >> /etc/httpd/conf/httpd.conf
echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
echo "ErrorLog logs/localhost-error_log" >> /etc/httpd/conf/httpd.conf
echo "CustomLog logs/localhost-access_log common" >> /etc/httpd/conf/httpd.conf
echo "</VirtualHost>" >> /etc/httpd/conf/httpd.conf

# End Of Ubuntu Installation And Start Up
