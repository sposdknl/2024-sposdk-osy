#!/usr/bin/env bash

echo "Dnes je:" `date`

echo "Počet ssh id_rsa.pub klicu"
echo "--------------------------"

ls -1 ../SSH/*.pub | wc -l

echo "--------------------------"
echo "Username:"
echo "--------------------------"

for i in `ls -1 ../SSH/`;
  do
     cat ../SSH/$i | awk -F'[\\\\@]' '{print $2}'
done

echo "--------------------------"
# EOF
