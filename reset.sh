#!/bin/bash
cal -h > a.txt
a=( $(wc -w a.txt) )
b=$(($a-9))
for (( i=1 ; "$i" <= "$b" ; i=$i+1 ))
do
for (( j=1 ; "$j" <= 4 ; j=$j+1 ))
do
echo -ne "0\t" >> slots.txt 
done
echo "" >> slots.txt
done
