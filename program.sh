#!/bin/bash
cat a.txt
#Write algorithm start
##colour set start
g="\033[42m"
bl="\033[44m"
y="\033[43m"
r="\033[41m"
n="\033[0m"
##colour set end
count=0
a=$(wc -l < a.txt)
echo "give date"
read slot

###colour selection start
b=( $( head -n $slot slots.txt | tail -1 ) )
for (( j=0 ; "$j" <= 3 ; j=$j+1 ))
do
	if [[ ( "${b[$j]}" == "0" ) ]]
	then
		count=$(($count+1))
	fi
done
if [ "$count" == "3" ]
then
	col=$g
fi
if [ "$count" == "2" ]
then
	col=$bl
fi
if [ "$count" == "1" ]
then
	col=$y
fi
if [ "$count" == "0" ]
then
	col=$r
fi
###colour selection end

##line select start
c=$( cat a.txt | grep -w $slot )
for(( p=1 ; "$p" <= "$a" ; p=$p+1 ))
do 
	b=$( head -n $p a.txt | tail -1 )
	if [ "$b" == "$c" ]
	then
	break
	fi
done
##line select end

for(( q=1 ; "$q" < "$a" ; q=$q+1 ))
do 
	b=$( head -n $q a.txt | tail -1 )
	if [ "$q" == "$p" ]
	then
	for num in ${b[@]}
	do
		if [ "$num" == "$slot" ]
		then
			echo -ne "$col""$num""$n""\t" >> b.txt
		else
			echo -ne "$num\t" >> b.txt
		fi
	done
	else
		for num in ${b[@]}
		do
			echo -ne "$num\t" >> b.txt
		done
		fi
		echo -ne "\n" >> b.txt
done
mv b.txt a.txt
#Write algorithm end
#slot-viewer start
echo ""
echo ""
echo "Enter slot"
b=( $(head -n $slot slots.txt | tail -1) )
if [ "${b[0]}" == 0 ]
then
echo "1)9-10"
fi
if [ "${b[1]}" == 0 ]
then
echo "2)11-12"
fi
if [ "${b[2]}" == 0 ]
then
echo "3)2-3"
fi
if [ "${b[3]}" == 0 ]
then
echo "4)4-5"
fi
#slot-viewer end
echo ""
echo ""
#slot writer start
avail=0
echo "enter slot"
read app
app=$(($app-1))
a=$(wc -l < slots.txt)
##check availabilty start
b=( $( head -n $slot slots.txt | tail -1 ) )
if [[  "${b[$app]}" == "1" ]]
	then
		avail=1
	else
		b[$app]=1
	fi
##check availability end
for(( q=1 ; "$q" < "$a" ; q=$q+1 ))
do 
	b=( $( head -n $q slots.txt | tail -1 ) )
	for (( j=0 ; "$j" <= 3 ; j=$j+1 ))
	do
		echo -ne "${b[j]}\t" >> slottemp.txt 
	done
	echo -ne "\n" >> slottemp.txt
done
##display status start
if [ "$avail" == "0" ]
then
echo "slot booked"
else
echo "slot unvailable"
fi
##display status end
mv slottemp.txt slots.txt
#slot-writer end
