#!/bin/bash
#  Program: assigment4.sh
#  Author: Miguel Arara
#  Fecha: 03/29/2020

FILE=/months/$2
for file in `ls images`
do
  if test -f "$FILE"; then
    mv $1 $2
  else
    cd months | mkdir $2
    mv $1 $2
done

