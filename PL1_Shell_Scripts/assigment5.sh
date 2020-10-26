# !/bin/bash
# Program: assigment5.sh
# Task: assigment1
# Author: Miguel Arara
# Date: 30-03-2020

total=0
find ./$1 -name "$2" | while read FILE;do
     count=$(grep -c ^ < "$FILE")
     echo $total
     let total=total+count
       echo TOTAL LINES COUNTED= $total
     done


for file in `ls`
  if test -f "$FILE"; then
    mv $1 $2
  else
    cd months | mkdir $2
    mv $1 $2
done

