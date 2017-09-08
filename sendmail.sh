#!/bin/bash

yum install -y mutt
yum install -y sendmail
yum install -y dovecot

systemctl start sendmail.service
systemctl enable sendmail.service

systemctl start dovecot.service
systemctl enable dovecot.service

# Automated mail test
cat /etc/hosts | mailx -s "test hosts" root@localhost
mailx -s "test user mail" mark@localhost < /etc/sysconfig/network
echo "root: mark max" >> /etc/aliases

systemctl restart sendmail.service

# Setup sendmail to receive email.
# sed -e 's/^DAEMON_OPTIONS/dnl DAEMON_OPTIONS/' > sendmail.mc.sed
# systemctl restart sendmail.service

mutt -f imaps://mark@localhost

exit 0