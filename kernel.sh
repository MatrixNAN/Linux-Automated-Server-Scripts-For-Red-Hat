#!/bin/bash

#su --
# Checks to see if the user is root or not
if [ "$HOME" = "/root" ] ; then	
	cd $HOME
	yumdownloader --source kernel
	yum install -y rpmdevtools
	rpm -Uhv kernel*rpm
	cd /root/rpmbuild/SPECS
	yum install -y xmlto asciidoc hmaccalc elfutils-devel "perl(ExtUtils::Embed)"
	rpmbuild -bp --target $(arch) kernel.spec
	cd /root/rpmbuild/BUILD/kernel*
	ls
	cp -Rfv linux* /usr/src/kernels
	ls /usr/src/kernels

	echo -n "Enter the version number of your linux distrobution: "
	read KernelVersionNumber
	ln -s /usr/src/kernels/linux-$KernelVersionNumber /usr/src/linux

	yum install -y gtk+ libglade2-devel glib

	make gconfig

	make clean; make vmlinux; make modules; make modules_install; make;

	# yum install -y mkinitrd
	make install
else
	echo "You must be root in order to be successful."
	echo -n "After entering the password for root rerun "
	echo "sh kernel.sh"
	echo
	echo -n "Enter your root password: "
	su -- 
fi # End of Root Administrator Test
# End Of Kernel Compiling
