#!/bin/bash -x
head=1
Hc=0
Tc=0
echo "How many times Coin flip :"
read N
for (( c=0 ; c<N ; c++ ))
do
	if (( $(($RANDOM%2))==$head ))
	then
		Hc=$(($Hc+1))
	else
		Tc=$(($Tc+1))
	fi
done

echo ":$Hc  :$Tc"

Hp=$(( $Hc*100 / $N ))
echo "Hp: $Hp"
Tp=$(( $Tc*100 / $N ))


echo "Percentage of Head Occure :$Hp "
echo "Percentage of Tail Occure :$Tp "

