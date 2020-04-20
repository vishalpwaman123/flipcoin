#!/bin/bash -x

head=1
tail=0
HH=0
HT=0
TH=0
TT=0


HHH=0
HHT=0
HTH=0
THH=0
HTT=0
THT=0
TTH=0
HHH=0



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

function Triple()
{
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


P[0]=$(( $HHH*100 / 8 ))
P[1]=$(( $HHT*100 / 8 ))
P[2]=$(( $HTH*100 / 8 ))
P[3]=$(( $THH*100 / 8 ))
P[4]=$(( $HTT*100 / 8 ))
P[5]=$(( $THT*100 / 8 ))
P[6]=$(( $TTH*100 / 8 ))
P[7]=$(( $TTT*100 / 8 ))
P1[0]="HHH"
P1[1]="HHT"
P1[2]="HTH"
P1[3]="THH"
P1[4]="HTT"
P1[5]="THT"
P1[6]="TTH"
P1[7]="TTT"

for ((c=0 ; c<8 ; c++))
do
		for ((m=$c+1 ; m<8 ; m++))
		do
			if (( P[$c] < P[$m] ))
			then
				temp=$(( P[$c] ))
				P[$c]=$(( P[$m] ))
				P[$m]=$temp
				temp=$(( P1[$c] ))
				P1[$c]=$(( P1[$m] ))
				P1[$m]=$temp
			fi
		done	
done

#echo "HHH % is : $HHHP %"
#echo "HHT % is : $HHTP %"
#echo "HTH % is : $HTHP %"
#echo "THH % is : $THHP %"

#echo "HTT % is : $HTTP %"
#echo "THT % is : $THTP %"
#echo "TTH % is : $TTHP %"
#echo "TTT % is : $TTTP %"

echo "Array : ${P[@]}"
echo "Array Index : ${!P[@]}"
echo "Highest ${P1[0]} Occures ${P[0]} times"

}
double
Triple
