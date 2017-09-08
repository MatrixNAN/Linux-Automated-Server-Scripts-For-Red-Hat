#!/bin/bash

# Test files and folders for nfs client which will go to
# /nfsserver
touch /home/student/nfsclient/stuff.txt
touch /home/student/nfsclient/morestuff.txt
mkdir /home/student/nfsclient/test
touch /home/student/nfsclient/test/testfile.txt
#chown student -R /mnt/nfsclient
#chgrp staff -R /mnt/nfsclient

echo "ls /home/student/nfsclient"
ls /home/student/nfsclient
 
echo "ls /nfsserver"
ls /nfsserver
 