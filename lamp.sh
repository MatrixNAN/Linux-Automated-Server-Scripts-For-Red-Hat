#!/bin/bash

# -eq =
# -gt >
# -lt <
# -ne !=
# -ge >=
# -le <=

InvalidInput="true"

if [ $# -eq 0 ] ; then
	echo "This program sets up and installs a LAMP server."
	echo -n "Which Linux Distro do you have? (centos/ubuntu/fedora) "
	read LinuxDistro
else
	LinuxDistro="$1"
fi
	
while [ "$InvalidInput" = "true" ]
do
	if [ "$LinuxDistro" = "centos" -o "$LinuxDistro" = "ubuntu" -o "$LinuxDistro" = "fedora" ] ; then
		InvalidInput="false"
		break
	else
		echo "You have entered an error."
		echo "You must type centos, fedora or ubuntu in all lowercase"
		echo "You typed $LinuxDistro"
		echo "This program sets up and installs a LAMP server."
		echo -n "Which Linux Distro do you have? (centos/ubuntu/fedora) "
		read LinuxDistro
	fi		
done

# Checks to see if the user wants to install LAMP for Centos
if [ "$LinuxDistro" = "centos" ] ; then
	# Checks to see if the user is root or not
	if [ "$HOME" = "/root" ] ; then	

		#==================================#
		#   This installs our LAMP Setup   #
		#==================================#

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

		# Python Web Development Server
		yum install -y python
	
		#==================================#
		#        Starting Servers          #
		#==================================#

		# Starting Apache Server
		/sbin/chkconfig httpd on
		/sbin/service httpd start

		# Starting MySQL Server
		/sbin/chkconfig mysqld on
		/sbin/service mysqld start

		echo "<?php phpinfo(); ?>" > /var/www/html/info.php

	else
		echo "You must be root in order to be successful."
		echo -n "After entering the password for root rerun "
		echo "sh lamp.sh"
		echo
		echo -n "Enter your root password: "
		su -- 
	fi # End of Root Administrator Test
	# End Of Centos Installation And Start Up

elif [ "$LinuxDistro" = "fedora" ] ; then
	if [ "$HOME" = "/root" ] ; then	
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

		echo "<?php phpinfo(); ?>" > /var/www/html/info.php

		echo "<VirtualHost *:80>" >> /etc/httpd/conf/httpd.conf
    		echo "ServerAdmin webmaster@localhost" >> /etc/httpd/conf/httpd.conf
    		echo "DocumentRoot /var/www/localhost/html" >> /etc/httpd/conf/httpd.conf
    		echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf
    		echo "ErrorLog logs/localhost-error_log" >> /etc/httpd/conf/httpd.conf
    		echo "CustomLog logs/localhost-access_log common" >> /etc/httpd/conf/httpd.conf
		echo "</VirtualHost>" >> /etc/httpd/conf/httpd.conf

	else
		echo "You must be root in order to be successful."
		echo -n "After entering the password for root rerun "
		echo "sh lamp.sh"
		echo
		echo -n "Enter your root password: "
		su -- 
	fi # End of Root Administrator Test
	# End Of Fedora Installation And Start Up

elif [ "$LinuxDistro" = "ubuntu" ] ; then
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

	echo "<?php phpinfo(); ?>" > /var/www/info.php

	# End Of Ubuntu Installation And Start Up
fi 


#echo -n "What is the location of your mysql server? "
#read mysqlserver

#echo $mysqlserver
exit 0