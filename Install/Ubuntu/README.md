# Install Ubuntu
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Install OS

Zde je návod na instalaci Ubuntu
[Ubuntu](https://www.ubuntu.cz/ziskat-ubuntu/stahnout-desktop/instalace/).

- Stáhněte ISO Ubuntu server (minimalized) 24.04.1 LTS z - [https://cz.releases.ubuntu.com/24.04.1/ubuntu-24.04.1-live-server-amd64.iso](https://cz.releases.ubuntu.com/24.04.1/ubuntu-24.04.1-live-server-amd64.iso)
- Nainstalujte do VirtualBoxu
- Seznamte se s nástrojem [Vagrant](https://www.vagrantup.com)
- Najděte si Image na [Vagrant portale](https://portal.cloud.hashicorp.com/vagrant/discover)

```console
apt install -y net-tools
apt install -y iputils-ping
apt install -y man
apt install -y git

dpkg -l | wc -l
dpkg -l > /tmp/minimalize-package.deb
unminimalize
dpkg -l | wc -l
dpkg -l > /tmp/unminimalize-package.deb

diff -u /tmp/minimalize-package.deb /tmp/unminimalize-package.deb
```
...