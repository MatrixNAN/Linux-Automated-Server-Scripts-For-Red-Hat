#!/bin/bash

cp /etc/samba/smb.conf ~

yum --enablerepo=fedora install -y samba-swat

#chkconfig swat on
systemctl enable xinetd.service
systemctl restart xinetd.service

mkdir /tmp/press
cp /etc/hosts /tmp/press
echo "http://localhost:901" | /usr/bin/firefox

systemctl restart smb.service
systemctl restart nmb.service

diff ~/smb.conf /etc/samba/smb.conf
cat /etc/samba/smb.conf
testparm
