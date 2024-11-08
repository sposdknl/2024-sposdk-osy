#!/usr/bin/env bash

# Instalace balicku net-tools
sudo apt-get install -y net-tools

# Stažení balíčku pro instalaci zabbix repo
sudo wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest+ubuntu22.04_all.deb

# Instalace meta balíčku
sudo dpkg -i zabbix-release_latest+ubuntu22.04_all.deb

# Aktualizace repository
sudo apt-get update

# Instalace meta balíčku
sudo apt-get install -y zabbix-agent2 zabbix-agent2-plugin-*

# Povoleni sluzby zabbix-agent2
sudo systemctl enable zabbix-agent2

# Restart sluzby zabbix-agent2
sudo systemctl restart zabbix-agent2

# EOF