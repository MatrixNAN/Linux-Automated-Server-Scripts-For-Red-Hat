#!/bin/bash

echo "Creating Users And Groups"

echo "Creating Staff Group"
groupadd -g 1004 staff

echo "Creating Press Group"
groupadd -g 1002 press

echo "Creating political Group"
groupadd -g 1003 political

echo "Creating User cjcraig"
useradd -G staff,press cjcraig
echo password | passwd --stdin cjcraig
echo "The password for cjcraig is password"

echo "Creating User toby"
useradd -G staff,press,political toby
echo password | passwd --stdin toby
echo "The password for toby is password"

echo "Creating User joshua"
useradd -G staff,press joshua
echo password | passwd --stdin joshua
echo "The password for joshua is password"

echo -n "Enter The User Name: "
read UserName
useradd -G staff,press $UserName
echo password | passwd --stdin $UserName
echo "The password for $UserName is password"
