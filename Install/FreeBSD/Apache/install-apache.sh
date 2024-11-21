#!/usr/bin/env bash

# Aktualizace repository
sudo pkg update

# Instalace balicku apache24
sudo pkg install -y apache24

# Povoleni sluzby apache24
sudo /usr/local/etc/rc.d/apache24 enable

# Restart sluzby apache24
sudo /usr/local/etc/rc.d/apache24 restart

# EOF