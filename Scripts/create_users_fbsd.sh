#!/usr/bin/env bash

#
# create_users_fbsd.sh - Ver 0.1
# Script vytvoří uřivatele na serveru FreeBSD - spos.pfsense.cz
# Nastaví opravnění na /home/$HOME a vytvoří web adresar public_html
# Vytvoří index.html
# Dále do /home/$HOME umístí ssh klíč uživatele   
#

echo -n "Počet uživatelů:"
ls -1 ../SSH/*.pub | wc -l

echo "----------------------------"
echo " Vytvoření systémových úctu:"
echo "----------------------------"

for i in `ls -1 ../SSH/*.pub`;
  do
     # Získání uživatelského jména z veřejného klíče bez 'skola\'
     username=$(awk '{print $NF}' "$i" | cut -d'@' -f1 | sed 's/skola\\//')

     # Kontrola, zda uživatel existuje
     if id "$username" &>/dev/null; then
        echo "Uživatel $username již existuje."
     else
        echo "Uživatel $username neexistuje, vytvářím..."
        # Vytvoření uživatele ve FreeBSD
        pw useradd "$username" -m -s /usr/local/bin/bash
        chmod 701 /home/$username
        mkdir -p /home/$username/public_html
        echo "<html><body><h1>It works! - User space of $username</h1></body></html>" > /home/$username/public_html/index.html
        mkdir -p /home/$username/.ssh
        chmod 700 /home/$username/.ssh
        cp ../SSH/$username-id_rsa.pub /home/$username/.ssh/authorized_keys
        chown -R $username:$username /home/$username/
        
        if [ $? -eq 0 ]; then
            echo "Uživatel $username byl úspěšně vytvořen."
        else
            echo "Chyba při vytváření uživatele $username."
        fi
     fi
done

# EOF
