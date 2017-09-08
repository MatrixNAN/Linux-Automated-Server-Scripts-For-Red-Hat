#!/bin/bash

yum install -y pure-ftpd
systemctl enable pure-ftpd.service
systemctl start pure-ftpd.service

echo "Host = localhost and the Username = student and the Password = password"
/usr/bin/filezilla
