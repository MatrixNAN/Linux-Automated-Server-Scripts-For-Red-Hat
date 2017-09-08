#!/bin/bash

ServerMessage="Choose which server you want to setup: "
echo $ServerMessage

select Server in dns nfs nis ldap sendmail vsftp ssh_server postfix lamp dovecot samba STOP
do	
	if [ "$Server" == "" ] ; then
		echo "You type nothing try again!!!"
		continue
	elif [ $Server = STOP ] ; then
		echo "Terminating Program!"
		break
	elif [ $Server = ssh_server ] ; then
		echo "Installing ssh server"
		sh ./ssh.sh
	elif [ $Server = lamp ] ; then
		echo "Installing LAMP server"
		sh lamp.sh
	elif [ $Server = samba ] ; then
		echo "Installing Samba server"
		sh sambaserver.sh
	fi
	
	echo "You chose $Server as your selection."
	echo -e "That is choice number $REPLY.\n"
	echo
	echo $ServerMessage
done

exit 0
