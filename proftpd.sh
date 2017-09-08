#!/bin/bash

yum install -y proftpd
systemctl enable proftpd.service
systemctl start proftpd.service
/usr/sbin/proftpd
echo "Host = localhost and the Username = anonymous"
/usr/bin/filezilla
