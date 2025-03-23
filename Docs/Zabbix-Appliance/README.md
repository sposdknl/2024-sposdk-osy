# Zabbix Appliance
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

![Zabbix Appliance](../../Images/zabbix-appliance.png)

## Install Zabbix Appliance 7.0 LTS

- Pro zprovoznění použijte soubor "Open virtualization format (.ovf)"
- Po deploy nevypínat VM, jinak se nedokončí interní konfigurace, vytvoření databáze a vytvoření hesel do DB - podrobnosti [zde](https://www.zabbix.com/documentation/7.0/en/manual/appliance#troubleshooting). Vytíženi VM mužete oveřit přihlášením do OS např. pomocí top. Uvidite aktivni proces mysql.
- Podrobná [dokumentace](https://www.zabbix.com/documentation/7.0/en/manual/appliance) na stránkách Zabbix.

### Konfigurace Install Zabbix Appliance

- Zkontrolujte vytvoření hesla
- Nastavte portforward na úrovni VirtualBoxu - 80 na 8080 a 22 na 2200
- Posléze se přihlašte pomoci SSH a WebGUI vyměňte Zabbix agenta, doinstalujte Zabbix Agent2
- http://127.0.0.1:8080 - user Admin heslo zabbix
- ssh root@127.0.0.1 -p 2200 - heslo zabbix

```console
grep DBPass /etc/zabbix/zabbix_server.conf 
### Option: DBPassword
# DBPassword=
DBPassword=e+Kb8nvjAtjZ3q2CtM0=
#	This option can only be used if DBUser and DBPassword are not specified.

dnf install -y zabbix-agent2

systemctl stop zabbix-agent
systemctl disable zabbix-agent

systemctl enable zabbix-agent2
systemctl start zabbix-agent2

tail -f /var/log/zabbix/zabbix_agent2.log
```

## Zprovozněte monitoring MySQL

- V Zabbix GUI vytvořte nového hosta "MySQL Database" např. jako klon Zabbix server. Promažte nevhodné šablony atd.
- Nalinkujte šablonu [MySQL by Zabbix agent 2](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/db/mysql_agent2).
- Vytvořte db usera pro monitoring a heslo viz dokumentace k šabloně.
- Nastavte Makra hosta viz šablona.

```console
mysql
use mysql

CREATE USER 'zbx_monitor'@'%' IDENTIFIED BY 'SPOS_2025_OSY';
GRANT REPLICATION CLIENT,PROCESS,SHOW DATABASES,SHOW VIEW ON *.* TO 'zbx_monitor'@'%';
```

### Makra pro MySQL

```console
{$MYSQL.USER}		zbx_monitor
{$MYSQL.PASSWORD}	SPOS_2025_OSY
{$MYSQL.DSN}		tcp://localhost:3306
```

### Kontrola funkčnosti MySQL monitoringu

- Test discovery databází - Database discovery
- Kliknětě na tlačítko Test a získejte LLD JSON
- Zkontrolute funkční grafy viz Dashboard

```console
[{"Database":"information_schema"},{"Database":"mysql"},{"Database":"performance_schema"},{"Database":"sys"},{"Database":"zabbix"}]
```

## Zprovozněte monitoring Nginx webserver

- V Zabbix GUI vytvořte nového hosta "Web server" např. jako klon Zabbix server. Promažte nevhodné šablony atd.
- Nalinkujte šablonu [Nginx by HTTP](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/app/nginx_http).
- Změňte konfiguraci Web serveru, aby monitoring fungoval.

```console
vi /etc/nginx/conf.d/zabbix.conf
...

location = /basic_status {
    stub_status;
}

systemctl restart nginx.service
```

### Makra pro Nginx

```console
{$NGINX.STUB_STATUS.HOST}		localhost
```

### Kontrola funkčnosti Nginx monitoringu

- Test správnosti fungování status page
- http://127.0.0.1:8080/basic_status
- Otestujte item - Get stub status page

```console
HTTP/1.1 200 OK
Server: nginx
Date: Sun, 23 Mar 2025 13:34:12 GMT
Content-Type: text/plain
Transfer-Encoding: chunked
Connection: keep-alive
Keep-Alive: timeout=20
Content-Encoding: gzip

Active connections: 3
server accepts handled requests
22 22 217
Reading: 0 Writing: 2 Waiting: 1 
```

...
