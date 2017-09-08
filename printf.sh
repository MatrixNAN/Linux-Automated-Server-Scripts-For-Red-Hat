#!/bin/bash

#***************************************************************#
# printf						   								#
#***************************************************************#
# These symbols are used with the percent sign. %	   			#
#===============================================================#
# s 	string													#
# c	single character											#
# d	decimal number												#
# x hexidecimal number											#
# o	octal number												#
# e	exponential floating point number							#
# f	float point fixed number									#
# g	compat floating point number								#
#***************************************************************#

#printf "%32s %s\n" "File Name" "File Type"
printf "%-32s %s\n" "File Name" "File Type"
#printf "%0s %s\n" "File Name" "File Type"
#printf "%s %s\n" "File Name" "File Type"

for i in *;
do
	printf "%-32s " "$i"
	
	if [ -d "$i" ] ; then
		echo "directory"
	elif [ -h "$i" ] ; then
		echo "symbolic link"
	elif [ -f "$i" ] ; then
		echo "file"
	else
		echo "unknown"
	fi;
done


exit 0
