#!/usr/bin/env bash

LOG_AUTH="/var/log/auth.log"

echo "Dnes je:" `date`

echo "Počet řádků v log souboru $LOG_AUTH"
echo "---------------------------------------"

cat $LOG_AUTH | wc -l

echo "Počet řádků řetězce ssh v souboru $LOG_AUTH"
echo "---------------------------------------"

cat $LOG_AUTH | grep ssh | wc -l

echo "---------------------------------------"

# EOF
