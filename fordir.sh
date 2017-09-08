#!/bin/bash

for dir in *
do
	# check to see if the items in the folder are files
	if [ -f "$dir" ] ; then
		echo "$dir"	

		if [ "$dir" = "lamp.sh" ] ; then
			echo "This is my awesome script!!!"
		fi
	fi
done

exit 0
