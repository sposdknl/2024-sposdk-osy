# Install Zabbix Agent2 on Ubuntu
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Automatická instalace Zabbix Agent2 OS Linux Ubuntu and Web server Apache2

- Vagrantfile obsahuje sekci pro aplikaci příkazů pro instalaci web serveru
  [Apache](https://httpd.apache.org/) a [Zabbix Agent2](https://www.zabbix.com/).

### Instalace Web server Apache2

```console
    sudo apt-get update
    sudo apt-get install -y net-tools
    sudo apt-get install -y apache2

    sudo systemctl enable apache2.service
    sudo systemctl restart apache2.service
```
### Instalace Zabbix Agent2

```console
    sudo apt-get update
    sudo apt-get install -y net-tools

    sudo apt-get install -y apache2

    sudo systemctl enable apache2.service
    sudo systemctl restart apache2.service
```
...