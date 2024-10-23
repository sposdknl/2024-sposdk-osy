#!/usr/bin/env bash

HTML_FILE=~/public_html/index.html

list_of_users() {
   > /tmp/users.txt # clean file
   for i in `ls -1 ../SSH/`;
     do 
        cat ../SSH/$i | awk -F'[\\\\@]' '{print $2}' >> /tmp/users.txt
   done
}

list_of_users

echo "<html><body><h1>SPOS server users web page</h1>" > $HTML_FILE
echo "<img src=./img/server-osy.webp Align=Right Height=50% Width=30%>" >> $HTML_FILE

for u in `cat /tmp/users.txt`;
  do 
     echo "<a href="https://spos.pfsense.cz/~$u">https://spos.pfsense.cz/~$u</a>" >> $HTML_FILE
     echo "<br>" >> $HTML_FILE
done

echo "<br>Help with base HTML - <a href=https://spos.pfsense.cz/~malylu/HaTMatiLka/><img src="https://spos.pfsense.cz/~malylu/HaTMatiLka/hatm2.gif" width=150></a>" >> $HTML_FILE
echo "</body></html>" >> $HTML_FILE

# EOF
