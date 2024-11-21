# Install Zabbix Agentd on FreeBSD
Repositories for teaching purposes at SPOS DK

![FreeBSD and ZabbixAgent OSY AI](../../../Images/osy-FreeBSD-ZabbixAgent.webp)

Repository pro vyuku na SPOS DK

## Automatická instalace Zabbix Agentd na OS FreeBSD

- Vagrantfile obsahuje sekci pro aplikaci příkazů pro instalaci monitorovacího
[Zabbix Agent](https://www.zabbix.com/).

### Instalace Zabbix Agent

```console
pkg install -y zabbix6-agent

/usr/local/etc/rc.d/zabbix_agentd enable
/usr/local/etc/rc.d/zabbix_agentd restart
```

### Konfigurace Zabbix Agentd

```console
joe /usr/local/etc/zabbix6/zabbix_agentd.conf
...
Hostname=freebsd-8e714c18
Server=enceladus.pfsense.cz
ServerActive=enceladus.pfsense.cz
Timeout=30
HostMetadata=SPOS

/usr/local/etc/rc.d/zabbix_agentd restart
```
...