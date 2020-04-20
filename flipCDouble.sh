#!/bin/bash -x

head=1
tail=0
HH=0
HT=0
TH=0
TT=0
for (( c=0 ; c<4 ; c++ ))
do
	arr[0]=$(($RANDOM%2))
	arr[1]=$(($RANDOM%2))
        if (( ${arr[0]}==$head && ${arr[1]}==$head )) 
	then
		HH=$(($HH+1))
	elif (( ${arr[0]}==$head && ${arr[1]}==$tail ))
	then
		HT=$(($HT+1))
	elif (( ${arr[0]}==$tail && ${arr[1]}==$head ))
	then
		TH=$(($TH+1))
	else
		TT=$(($TT+1))
	fi
done

HHP=$(( $HH*100 / 4 ))
HTP=$(( $HT*100 / 4 ))
THP=$(( $TH*100 / 4 ))
TTP=$(( $TT*100 / 4 ))

echo "HH % is : $HHP %"
echo "HT % is : $HTP %"
echo "TH % is : $THP %"
echo "TT % is : $TTP %"
