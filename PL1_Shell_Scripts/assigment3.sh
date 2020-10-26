#!/bin/bash
#  Program: assigment3.sh
#  Author: Miguel Arara
#  Fecha: 03/29/2020

echo "Date: 25-02-2008"
echo "------------------------------"

countGET=1
countPOST=1
oldIFS=$IFS
IFS=$'\n'
for line in $(cat localhost_access_log.2008-02-25.txt)
do
 if [grep GET localhost_access_log.2008-02-25.txt]
   then
    echo "$countGET: $line"
     ((countGET++))
 else
    if [grep POST localhost_access_log.2008-02-25.txt]
      then
       echo "$countPOST: $line"
        ((countPOST++));
    fi
fi
done
IFS=$old_IFS

