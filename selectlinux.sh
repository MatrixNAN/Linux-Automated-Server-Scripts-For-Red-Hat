#!/bin/bash

LinuxVersionMessage="Choose which flavor of linux you want to use: "
echo $LinuxVersionMessage

select LinuxDistro in fedora centos ubuntu mandriva suse STOP
do	
	if [ "$LinuxDistro" == "" ] ; then
		echo "You type nothing try again!!!"
		continue
	elif [ $LinuxDistro = STOP ] ; then
		echo "Terminating Program!"
		break
	fi
	
	echo "You chose $LinuxDistro as your selection."
	echo -e "That is choice number $REPLY.\n"
	echo
	echo $LinuxVersionMessage
done

exit 0
