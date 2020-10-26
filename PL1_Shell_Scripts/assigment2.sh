# !/bin/bash
# Program: assigment2.sh
# Task: assigment1
# Author: Miguel Arara
# Date: 03-28-2020

fruits=(banana,apple,strawberry,grape,watermelon)
grep -i $fruits food.txt
grep -v $fruits food.txt
sudo grep -r CBD674803
find . -mtime -7 | find . -mtime -14

for i in $(seq 20)
do
 printf "$i "
done
