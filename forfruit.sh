#!/bin/bash

count=0
sum=0
#count=count+1
#count++
#++count
echo "$count count value"

#set -x
for fruit in apples oranges pears bananas
do
	sum=$(((count-- * 4)+$sum))
	echo "sum = $sum"
	echo -n "$fruit "
	echo "$count count value"
done
#set +x

echo "Sum = $sum"

echo

exit 0
 