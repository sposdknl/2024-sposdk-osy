# Install FreeBSD
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Install OS

Nainstalujte si OS [FreeBSD](https://www.freebsd.org/releases/14.1R/announce/)
pomocí [Vagrantfile](https://app.vagrantup.com/freebsd/boxes/FreeBSD-14.1-RELEASE)
Windows instalator [vagrant_2.4.1_windows_amd64.msi](https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_windows_amd64.msi)
dále pak verzovací nástroj [Git-2.46.0-64-bit.exe](https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe)
pro získání souborů tohoto projektu a SSH terminal [putty-64bit-0.81-installer.msi](https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.81-installer.msi)
pro přihlášení na konzoli. Vagrant vyžaduje [VirtualBox-6.1.50-161033-Win.exe](https://download.virtualbox.org/virtualbox/6.1.50/VirtualBox-6.1.50-161033-Win.exe) 

```console
apt install vagrant
nebo
vagrant_2.4.1_windows_amd64.msi

git clone https://github.com/smejdil/2024-sposdk-osy/
cd Install/FreeBSD

vagrant plugin install virtualbox
vagrant plugin install vagrant-disksize
vagrant plugin list
vagrant-disksize (0.1.3, global)
vagrant-libvirt (0.7.0, system)
virtualbox (0.8.6, global)

vagrant up
vagrant ssh
```

## Konfigurace

Po instalaci FreeBSD se připojíme pomoci Putty na localhost port 2201 pod uživatelem vagrant s heslem vagrant. Provedeme stažení portů a zkompilujeme editor joe.

```console
pkg install -y portsnap
portsnap fetch
mkdir -p /var/db/portsnap
portsnap extract

portsnap fetch && portsnap update && pkg version -v | grep upd

touch /etc/make.conf
echo "BATCH=yes" > /etc/make.conf

pkg install joe

cd /usr/ports
make fetchindex
make search name=joe
cd /usr/ports/editors/joe
make install clean

echo freebsd | pw mod user root -h 0
```
...