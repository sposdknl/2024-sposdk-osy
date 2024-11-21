#!/usr/bin/env bash

# Aktualizace repository
sudo pkg update

# Instalace balicku mariadb server
sudo pkg install -y mariadb114-server

# Povoleni sluzby mariadb server
sudo /usr/local/etc/rc.d/mysql-server enable

# Restart sluzby mariadb server
sudo /usr/local/etc/rc.d/mysql-server restart

# EOF