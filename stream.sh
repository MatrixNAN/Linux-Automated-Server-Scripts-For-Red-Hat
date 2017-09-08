#!/bin/bash

printf "%-32s %s\n" "File Name" "File Type"

sed -e '/^went to the store\./d' /home/student/Scripts/whatever.txt

sed -e 's/^([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$/(555) 555-5555/' /home/student/Scripts/whatever.txt

cut -d: -f1,6 /etc/passwd | tr : "\t" | awk '{ printf "Users: " $1 ",\t\tHome Directory: " $2 "\n" }'
