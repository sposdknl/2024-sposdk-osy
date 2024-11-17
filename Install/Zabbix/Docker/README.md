# Install Zabbix
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Install Monitoring System

Install [Zabbix](https://www.zabbix.com) pomocí [Docker](https://www.docker.com)

```console
vagrant up
vagrant ssh
apt install ansible
ansible-playbook pre-install-docker.yml
git clone https://github.com/zabbix/zabbix-docker
docker compose -f ./docker-compose_v3_ubuntu_pgsql_latest.yaml up -d
```

...