#!/bin/bash

#************************************************************#
# Regular Expressions					     #
# ---------------------------------------------------------- #
# .	Any single character match
# *	Any number of character matches aka all characters
# [chars]	Defined character sequences. no spaces!!!
#	[a-z][A-Z][a-zA-Z][0-9][a-zA-Z0-9]
# ^	Denotes the beginning of a string
# $	Denotes the end of a string
# \	Escape character.
# //	Denotes the regular expression begin and end.
#************************************************************#

#************************************************************#
# SED							     #
# ---------------------------------------------------------- #
# p	prints the line					     #
# d	delete the line					     #
# s	/regular expression/regular expression/		     #
#************************************************************#

sed -e '/^went/d' /home/student/Scripts/whatever.txt
sed -e 's/^went//' /home/student/Scripts/whatever.txt

went to the store.
Jill went to the store.

sed -e 's/Paech/Peach/' -e 's/ *[0-9][0-9]*\.[0-9][0-9]$/\$&/'

sed -e '/^went to the store\./d' /home/student/Scripts/whatever.txt

sed -e 's/^([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$/(555) 555-5555/'


Paech
Peach

file00.15
$&
