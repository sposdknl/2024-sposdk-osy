#!/usr/bin/env bash

# Aktualizace repository
sudo pkg update

# Instalace balicku zabbix agent
sudo pkg install -y zabbix6-agent

# Povoleni sluzby zabbix agent
sudo /usr/local/etc/rc.d/zabbix_agentd enable

# Restart sluzby zabbix agent
sudo /usr/local/etc/rc.d/zabbix_agentd restart

# EOF