#!/usr/bin/env bash

#change the note into python file
#can be also edited to rename files
cd "~/Desktop" #change the directory here
for file in *.txt; do
  name=$(basename "$file" .txt)
  echo mv "$file" "$name.py"
done
