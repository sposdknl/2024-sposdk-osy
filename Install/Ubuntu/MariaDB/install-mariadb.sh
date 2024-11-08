#!/usr/bin/env bash

 # Instalace MySQL serveru (MariaDB)
 sudo apt-get install -y mariadb-server

# Instalace balicku mariadb
 sudo systemctl enable mariadb

# Povoleni sluzby mariadb
sudo systemctl enable mariadb

# Start sluzby mariadb
sudo systemctl start mariadb

# EOF