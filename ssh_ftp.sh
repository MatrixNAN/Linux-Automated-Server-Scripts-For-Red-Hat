#!/bin/bash
yum install -y openssh
yum install -y vsftpd
yum install -y filezilla
yum install -y policycoreutils-gui

systemctl enable sshd.service
systemctl start sshd.service
systemctl enable vsftpd.service
systemctl start vsftpd.service
