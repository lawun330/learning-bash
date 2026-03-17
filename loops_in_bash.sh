#!/usr/bin/env bash

#while loop
n=0
while [ $n -le 5 ] ; do
  echo "While iteration $n"
  ((n+=1))
done;

#for loop
for (( i = 0; i < 2; i++ )); do
  echo "For iteration $i"
done;
