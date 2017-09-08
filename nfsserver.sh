#!/bin/bash

# Install NFS
yum install -y nfs-utils

#Start And Run NFS
systemctl enable nfs.service
systemctl start nfs.service

echo "Creating Staff Group"
groupadd staff

echo "Creating User student"
useradd -G staff student
echo password | passwd --stdin student
echo "The password for student is password"

mkdir /nfsserver
chown student /nfsserver
chgrp staff /nfsserver
chmod 770 /nfsserver

mkdir /home/student/nfsclient
chown student /home/student/nfsclient
chgrp staff /home/student/nfsclient
chmod 770 /home/student/nfsclient

echo "/nfsserver *(rw,sync)" >> /etc/exports
# How to limit to a particular IP Address Range
# 10.71.108.0 - 10.71.108.255
echo "# /nfsserver 10.71.108.0:255.255.255.0(rw,sync)" >> /etc/exports
exportfs -r

mount localhost:/nfsserver /home/student/nfsclient

# Mount at boot the NFS server folder /nfsserver and we 
# mount it to /home/student/nfsclient
# If the NFS server is down the NFS client machines can not
# boot up until the NFS server is up and running again.
echo "#localhost:/nfsserver /home/student/nfsclient nfs defaults 0 0" >> /etc/fstab 

su student
