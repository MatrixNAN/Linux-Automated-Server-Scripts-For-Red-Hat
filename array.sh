#!/bin/bash

Installs=(httpd mysql mysql-server php php-gd php-common php-mcrypt php-pear php-pecl-memcache php-mhash php-mysql php-xml phpmyadmin)

function Installing () {
	for InstallServer in ${Installs[@]}	
	do
		yum install -y $InstallServer
	done
}

Installing

exit 0
