#!/bin/bash

#***************************************************************#
# AWK								#
#***************************************************************#
# The most powerful shell command				#
# uses regular expressions and decision structures and 		#
# control structures						#
# cat /etc/passwd | tr : '\t'					#
# use the tr command in order to make a delimiter based file 	#
# into a tabbed based file.  This command requires that a |     #
# operator is used in conjunction with this command.		#
#===============================================================#
# awk '/pattern/ { actions }'
# awk '> < <= >= = && || { actions }'
# awk '
#	BEGIN { actions }
#	/patterns/ { actions }
#	/patterns/ { actions }
#	END { actions }
# ' file
#***************************************************************#

for i in $@
do
	if [ "$i" ] ; then
awk 'BEGIN { printf "%s\t", FILENAME ; }
	/^ *$/ { x+=1 ; }
     END { ave=100*(x/NR) ; printf " %s\t%3.1f\n",x,ave; }
    ' "$i"
	else
		echo "ERROR: $i not a file." >&2
	fi
done

awk '{
	printf "%s\t",$0;
	if ( $2 ~ /\$[1-9][0-9]*\.[0-9][0-9]/) {
		printf " * ";
		if ( $3 <= 75 ) {
			printf "REORDER\n" ; 
		} else {
			printf "\n";
		}
	} else {
		if ( $3 < 75 ) {
			printf "   REORDER]\n" ;
		} else {
			printf "\n" ;
		}
	}' fruit_prices.txt ;
	

exit 0
 