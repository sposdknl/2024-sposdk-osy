#!/usr/bin/env bash

# Install uuid and gsed
sudo pkg install -y p5-UUID gsed

# Unikatni hostname rocky-linux (Lepší než hostname školní stanice)
UNIQUE_HOSTNAME="freebsd-$(uuidgen)"
SHORT_HOSTNAME=$(echo $UNIQUE_HOSTNAME | cut -d'-' -f1,2)

# Konfigurace /usr/local/etc/zabbix6/zabbix_agentd.conf
sudo cp -v /usr/local/etc/zabbix6/zabbix_agentd.conf /usr/local/etc/zabbix6/zabbix_agentd.conf-orig
sudo gsed -i "s/Hostname=Zabbix server/Hostname=$SHORT_HOSTNAME/g" /usr/local/etc/zabbix6/zabbix_agentd.conf
sudo gsed -i 's/Server=127.0.0.1/Server=enceladus.pfsense.cz/g' /usr/local/etc/zabbix6/zabbix_agentd.conf
sudo gsed -i 's/ServerActive=127.0.0.1/ServerActive=enceladus.pfsense.cz/g' /usr/local/etc/zabbix6/zabbix_agentd.conf
sudo gsed -i 's/# Timeout=3/Timeout=30/g' /usr/local/etc/zabbix6/zabbix_agentd.conf
sudo gsed -i 's/# HostMetadata=/HostMetadata=SPOS/g' /usr/local/etc/zabbix6/zabbix_agentd.conf
sudo diff -u /usr/local/etc/zabbix6/zabbix_agentd.conf-orig /usr/local/etc/zabbix6/zabbix_agentd.conf

# Restart sluzby zabbix-agentd
sudo /usr/local/etc/rc.d/zabbix_agentd restart

# EOF