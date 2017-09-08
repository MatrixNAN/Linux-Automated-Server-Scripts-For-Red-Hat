#!/bin/bash
# Fedora 17 

yum install -y samba

# Centos SUSE Mandriva
#/sbin/chkconfig smb on
#/sbin/chkconfig nmb on
#/sbin/service smb start
#/sbin/service nmb start

# Ubuntu
#service smb start
#service nmb start

# Fedora
systemctl enable smb.service
systemctl enable nmb.service

systemctl start smb.service
systemctl start nmb.service

echo "Creating Staff Group"
groupadd staff

echo "Creating User student"
useradd -G staff student
echo password | passwd --stdin student
echo "The password for student is password"

echo "Creating User mark"
useradd -G staff mark
echo password | passwd --stdin mark
echo "The password for mark is password"

echo "Creating User max"
useradd -G staff max
echo password | passwd --stdin max
echo "The password for max is password"

mkdir /tmp/shared
chgrp staff /tmp/shared
chown student /tmp/shared
chmod 770 /tmp/shared

echo "student = student" >> /etc/samba/smbusers
echo "mark = mark" >> /etc/samba/smbusers
echo "max = max" >> /etc/samba/smbusers

echo password | smbpasswd -s -a student
echo password | smbpasswd -s -a mark
echo password | smbpasswd -s -a max

#setsebool -P samba_domain_controller on
#setsebool -P samba_enable_home_dirs on

echo "" >> /etc/samba/smb.conf
echo "[TEMP]" >> /etc/samba/smb.conf
echo "comment = public share of /tmp" >> /etc/samba/smb.conf
echo "path = /tmp" >> /etc/samba/smb.conf
echo "" >> /etc/samba/smb.conf

echo "[West]" >> /etc/samba/smb.conf
echo "comment = Files for the west wing staff" >> /etc/samba/smb.conf
echo "path = /tmp/shared" >> /etc/samba/smb.conf
echo "browseable = no" >> /etc/samba/smb.conf
echo "write list = +staff" >> /etc/samba/smb.conf
echo "" >> /etc/samba/smb.conf

echo "Logging Into Users"

smbclient -N -L localhost
smbclient -N -L localhost -U student
smbclient -N -L localhost -U mark
smbclient -N -L localhost -U max

testparm
