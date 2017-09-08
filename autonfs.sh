#!/bin/bash

# Install the Repository for autofs so that the program can be installed 
# and then install the autofs program.  Then enable autofs to run at boot
# and start autofs right now without the need to reboot the system.
yum --enablerepo=fedora install -y autofs
systemctl enable autofs.service
systemctl start autofs.service

# Add nfs to autofs so that it will generate a new folder on the system called nfs.
# This new director will be located at /nfs
echo "" >> /etc/auto.master
echo "/nfs /etc/auto.nfs" >> /etc/auto.master
# Add the nfsserver folder to the nfs folder and have it be mounted to localhost:/nfsserver
echo "nfsserver	-rw,soft,intr 	localhost:/nfsserver" > /etc/auto.nfs
# Below is an example of how to add another nfs share from another server.  
# Try with your other lab mate if you like by using an ip address instead of someserver
echo "# anothernfsshare	-rw,soft,intr 	someserver:/anothernfsshare" >> /etc/auto.nfs 

# restart the autofs system so that the changes can take effect immediately without the need
# to restart the entire computer.
systemctl restart autofs.service

# Test that it is working
ls /nfs/nfsserver

# Create a symbolic link in the users home directories to make life easy for that user and yourself.
ln -s /nfs/nfsserver /home/student/NFSServer
# Change the permissions back to that of the user student.  Remember after creating 
# anything with a user it gets the ownership and group of that user in this case root
# so thats why we must change it. 
chown student /home/student/NFSServer
chgrp student /home/student/NFSServer
