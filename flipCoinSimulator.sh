#!/bin/bash -x

head=1
check=$(($RANDOM%2))

if (($check==$head))
then
	echo "Head Occured"
else
	echo "Tail Occured"
fi
