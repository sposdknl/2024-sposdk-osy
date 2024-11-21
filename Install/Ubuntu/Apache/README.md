# Install Apache on Ubuntu
Repositories for teaching purposes at SPOS DK

![Ubuntu and Apache OSY AI](../../../Images/osy-Ubuntu-Apache.webp)

Repository pro vyuku na SPOS DK

## Automatická instalace OS Linux Ubuntu and Web server Apache2

- Vagrantfile obsahuje sekci pro aplikaci příkazů pro instalaci web serveru
  [Apache](https://httpd.apache.org/).

```console
apt-get update
apt-get install -y apache2

systemctl enable apache2
systemctl start apache2
```
...