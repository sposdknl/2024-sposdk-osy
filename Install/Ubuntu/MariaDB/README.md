# Install MariaDB on Ubuntu
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Automatická instalace OS Linux Ubuntu and SQL database MariaDB

- Vagrantfile obsahuje sekci pro aplikaci příkazů pro instalaci databaze
  [MariaDB](https://mariadb.org).

```console
apt-get install -y mariadb-server

systemctl enable mariadb
systemctl start mariadb
```
...