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
		sh lampcentos.sh
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
		sh lampfedora.sh
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
	sh lampubuntu.sh
fi 


#echo -n "What is the location of your mysql server? "
#read mysqlserver

#echo $mysqlserver
exit 0
