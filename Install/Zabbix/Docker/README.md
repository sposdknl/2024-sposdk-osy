# Install Zabbix
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Install Monitoring System

Install [Zabbix](https://www.zabbix.com) pomocí [Docker](https://www.docker.com)

```console
vagrant up
vagrant ssh
sudo apt update
sudo apt install ansible net-tools
git clone https://github.com/sposdknl/2024-sposdk-osy.git
cd 2024-sposdk-osy/Install/Zabbix/Docker/
ansible-playbook pre-install-docker.yml
cd
git clone https://github.com/zabbix/zabbix-docker
cd zabbix-docker
docker compose -f ./docker-compose_v3_ubuntu_pgsql_latest.yaml up -d
```
...