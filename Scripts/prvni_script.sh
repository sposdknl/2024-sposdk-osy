#!/usr/bin/env bash

LOG_AUTH="/var/log/auth.log"

echo "Dnes je:" `date`

echo "Pocet radku v logu"
echo "---------------------------------------"

cat $LOG_AUTH | wc -l

echo "Pocet radku vyrazu deb v logu"
echo "---------------------------------------"

cat $LOG_AUTH | grep ssh | wc -l

echo "---------------------------------------"

# EOF