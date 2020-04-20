#!/bin/bash -x

head=1
tail=0

HHH=0
HHT=0
HTH=0
THH=0
HTT=0
THT=0
TTH=0
HHH=0

for (( c=0 ; c<8 ; c++ ))
do
	arr[0]=$(($RANDOM%2))
	arr[1]=$(($RANDOM%2))
	arr[2]=$(($RANDOM%2))

        if (( ${arr[0]}==$head && ${arr[1]}==$head && ${arr[2]}==$head)) 
	then
		HHH=$(($HHH+1))
	elif (( ${arr[0]}==$head && ${arr[1]}==$head && ${arr[2]}==$tail))
	then
		HHT=$(($HHT+1))
	elif (( ${arr[0]}==$head && ${arr[1]}==$tail && ${arr[2]}==$head))
	then
		HTH=$(($HTH+1))
	elif (( ${arr[0]}==$tail && ${arr[1]}==$head && ${arr[2]}==$head))
	then
		THH=$(($THH+1))
	elif (( ${arr[0]}==$head && ${arr[1]}==$tail && ${arr[2]}==$tail))
	then
		HTT=$(($HTT+1))
	elif (( ${arr[0]}==$tail && ${arr[1]}==$head && ${arr[2]}==$tail))
	then
		THT=$(($THT+1))
	elif (( ${arr[0]}==$tail && ${arr[1]}==$tail && ${arr[2]}==$head))
	then
		TTH=$(($TTH+1))
	else
		TTT=$(($TTT+1))
	fi
done


HHHP=$(( $HHH*100 / 8 ))
HHTP=$(( $HHT*100 / 8 ))
HTHP=$(( $HTH*100 / 8 ))
THHP=$(( $THH*100 / 8 ))

HTTP=$(( $HTT*100 / 8 ))
THTP=$(( $THT*100 / 8 ))
TTHP=$(( $TTH*100 / 8 ))
TTTP=$(( $TTT*100 / 8 ))


echo "HHH % is : $HHHP %"
echo "HHT % is : $HHTP %"
echo "HTH % is : $HTHP %"
echo "THH % is : $THHP %"

echo "HTT % is : $HTTP %"
echo "THT % is : $THTP %"
echo "TTH % is : $TTHP %"
echo "TTT % is : $TTTP %"
