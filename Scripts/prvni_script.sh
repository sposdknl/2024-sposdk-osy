#!/bin/bash
echo "Dnes je:" `date`

echo "Pocet radku v logu"
echo "---------------------------------------"

cat /var/log/apt/term.log | wc -l

echo "Pocet radku vyrazu deb v logu"
echo "---------------------------------------"

cat /var/log/apt/term.log | wc -l | grep deb

# EOF
