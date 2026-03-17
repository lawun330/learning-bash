#!/usr/bin/env bash

#retrying the failed command
#pass the command as parameter
n=0
command=$1 #as sys.argv[1]

#either succeed or failed for 5 times
while ! $command && [ $n -le 5 ]; do
  sleep $n
  ((n+=1))
  echo "Command retrial - $n"
done;
