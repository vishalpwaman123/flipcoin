#!/bin/bash -x

head=1
tail=0
HH=0
HT=0
TH=0
TT=0
function double()
{
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
	p1[0]="HH"
	p1[1]="HT"
	p1[2]="TH"
	p1[3]="TT"

	P[0]=$(( $HH*100 / 4 ))
	P[1]=$(( $HT*100 / 4 ))
	P[2]=$(( $TH*100 / 4 ))
	P[3]=$(( $TT*100 / 4 ))

	echo "HH % is : ${P[0]} %"	
	echo "HT % is : ${P[1]} %"
	echo "TH % is : ${P[2]} %"
	echo "TT % is : ${P[3]} %"
	
	for ((c=0 ; c<4 ; c++))
	do
		for ((m=$c+1 ; m<4 ; m++))
		do
			if (( arr[$c] < arr[$m] ))
			then
				temp=$(( P[$c] ))
				P[$c]=$(( P[$m] ))
				P[$m]=$temp
				
				temp=$(( p1[$c] ))
				p1[$c]=$(( p1[$m] ))
				p1[$m]=$temp
			fi
		done	
	done

	echo "Array : ${P[@]}"
	echo "Array Index : ${!P[@]}"
	echo "Highest ${p1[0]} Occures ${P[0]} times" 

}
double
