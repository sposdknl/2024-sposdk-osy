# Install Zabbix Agent2 on RockyLinux
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Automatická instalace Zabbix Agent2 na OS RockyLinux

- Vagrantfile obsahuje sekci pro aplikaci příkazů pro instalaci monitorovacího
[Zabbix Agent2](https://www.zabbix.com/).

### Instalace Zabbix Agent2

```console
rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-release-latest.el9.noarch.rpm
dnf clean all

dnf install -y zabbix-agent2 zabbix-agent2-plugin-* 

systemctl enable zabbix-agent2
systemctl start zabbix-agent2
```

### Konfigurace Zabbix Agent2

```console
joe /etc/zabbix/zabbix_agent2.conf
...
Hostname=rockylinux-8e714c18
Server=enceladus.pfsense.cz
ServerActive=enceladus.pfsense.cz
Timeout=30
HostMetadata=SPOS

systemctl restart zabbix-agent2
...