#!/usr/bin/env bash

# Aktualizace repository
sudo apt-get update

# Instalace balicku net-tools
sudo apt-get install -y net-tools

# Instalace balicku apache2
sudo apt-get install -y apache2

# Povoleni sluzby apache2
sudo systemctl enable apache2.service

# Restart sluzby apache2
sudo systemctl restart apache2.service

# EOF