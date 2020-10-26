# !/bin/bash 
# Program: assigment1.sh 
# Task: assigment1
# Author: Miguel Arara
# Date: 03-28-2020

testVar="This is a test string"
echo $testVar

variablefileList=*
echo $variablefileList

variabletestConcat="${testVar}. ${testVar}. ${testVar}."
echo $variabletestConcat

a=4
b=3
c=7
result=$(((a+4)*b%c))
echo $result

wc *.txt
