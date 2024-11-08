# Install MariaDB on RockyLinux
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Automatická instalace OS RockyLinux and SQL database MariaDB

- Vagrantfile obsahuje sekci pro aplikaci příkazů pro instalaci databaze
  [MariaDB](https://mariadb.org).

```console
dnf install -y mariadb
dnf install -y mariadb-server

systemctl enable mariadb
systemctl start mariadb
```
...