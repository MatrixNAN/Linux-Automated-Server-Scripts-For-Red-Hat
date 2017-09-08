#!/bin/bash

echo -n "Enter in a distribution of Linux: "
read LinuxDistro

case $LinuxDistro in
	fedora|Fedora)
		echo "Setting up Fedora."
		;;
	ubuntu|Ubuntu)
		echo "Setting up Ubuntu."
		;;
	*)
		echo "I don't know that distribution of Linux."
		;;
esac

exit 0
 