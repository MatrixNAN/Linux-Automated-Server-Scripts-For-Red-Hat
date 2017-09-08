#!/bin/bash

# This installs our LAMP Setup
yum install -y httpd
yum install -y mysql
yum install -y mysql-server
yum install -y php
yum install -y php-gd
yum install -y php-common 
yum install -y php-mcrypt 
yum install -y php-pear 
yum install -y php-pecl-memcache 
yum install -y php-mhash 
yum install -y php-mysql 
yum install -y php-xml
yum install -y phpmyadmin

# Python Web Development Server
yum install -y python

#==================================
# Starting Servers
#==================================

# Starting Apache Server
#/sbin/chkconfig httpd on
#/sbin/service httpd start
systemctl enable httpd.service
systemctl start httpd.service

# Starting MySQL Server
#/sbin/chkconfig mysqld on
#/sbin/service mysqld start
systemctl enable mysqld.service
systemctl start mysqld.service

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
