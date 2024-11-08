# Install RockyLinux
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Automatická instalace OS RockyLinux pomocí Vagrant

- Seznamte se s nástrojem [Vagrant](https://www.vagrantup.com)
- Najděte si informace o Image - Box na [Vagrant portale](https://portal.cloud.hashicorp.com/vagrant/discover)
- Budeme instalovat distribuci [RockyLinux](https://rockylinux.org/cs)

```console
mkdir work
cd work
git clone https://github.com/sposdknl/2024-sposdk-osy.git

- Vytvořte si nový virtuální server pomocí Vagrant
- Připojte se pomocí PuTTY k RockyLinux pomocí ssh klíče pod uživatelem vagrant
- Vyzkoušejte PuTTY, vagrant ssh, nebo jen ssh vagrant@localhost - tři způsoby.

```console
PS C:\Users\hp\work\2024-sposdk-osy\Install\RockyLinux> vagrant up
...

PS C:\Users\hp\work\2024-sposdk-osy\Install\RockyLinux> vagrant status
...

PS C:\Users\hp\work\2024-sposdk-osy\Install\RockyLinux> vagrant ssh
...

```
...