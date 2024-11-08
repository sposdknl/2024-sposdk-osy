#!/usr/bin/env bash

# Instalace MySQL serveru (MariaDB)
sudo dnf install -y mariadb
sudo dnf install -y mariadb-server

# Povoleni sluzby mariadb
sudo systemctl enable mariadb

# Start sluzby mariadb
sudo systemctl start mariadb

# EOF