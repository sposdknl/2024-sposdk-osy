# Install FreeBSD
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Install OS

Nainstalujte si OS [FreeBSD](https://www.freebsd.org/releases/14.1R/announce/)
pomocí [Vagrantfile](https://app.vagrantup.com/freebsd/boxes/FreeBSD-14.1-RELEASE)
Windows instalator [vagrant_2.4.1_windows_amd64.msi](https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_windows_amd64.msi)
dále pak verzovací nástroj [Git-2.47.0-64-bit.exe](https://github.com/git-for-windows/git/releases/download/v2.47.0.windows.1/Git-2.47.0-64-bit.exe)
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

- Po instalaci FreeBSD se připojíme pomoci Putty na localhost port 2201 pod uživatelem vagrant s heslem vagrant.
- Provedeme stažení portů a zkompilujeme editor joe.

```console
pkg install -y portsnap
mkdir -p /var/db/portsnap
portsnap fetch
portsnap extract

portsnap fetch && portsnap update && pkg version -v | grep upd

touch /etc/make.conf
echo "BATCH=yes" > /etc/make.conf

# Instalace editoru joe z repository z balicku
pkg install -y joe 
pkg install -y gmake

cd /usr/ports
make fetchindex

pkg info | grep joe
joe-4.6_1,1                    Joe's Own Editor

pkg delete joe-4.6_1,1
Checking integrity... done (0 conflicting)
Deinstallation has been requested for the following 1 packages (of 0 packages in the universe):

Installed packages to be REMOVED:
	joe: 4.6_1,1

Number of packages to be removed: 1

The operation will free 2 MiB.

Proceed with deinstalling packages? [y/N]: y
[1/1] Deinstalling joe-4.6_1,1...
[1/1] Deleting files for joe-4.6_1,1: 100%

# Instalace editoru joe z portu - vlastni balicek
cd /usr/ports
make search name=joe

ort:	joe-4.6_1,1
Path:	/usr/ports/editors/joe
Info:	Joe's Own Editor
Maint:	juergen.gotteswinter@googlemail.com
B-deps:	gettext-runtime-0.22.5 gmake-4.4.1 indexinfo-0.3.1
R-deps:	
WWW:	https://sourceforge.net/projects/joe-editor/

cd /usr/ports/editors/joe
make package
ls -l work/pkg/joe-4.6_1,1.pkg 
-rw-r--r--  1 root wheel 512074 Sep 29 13:51 work/pkg/joe-4.6_1,1.pkg

pkg install work/pkg/joe-4.6_1,1.pkg

pkg delete joe-4.6_1,1

# Instalace editoru joe z portu - kompilace a instalace
cd /usr/ports/editors/joe
make install clean

# Zmena root hesla
echo freebsd | pw mod user root -h 0

# Instalace dalsich programu
pkg install -y mc
pkg install -y portupgrade
pkg install -y nmap
pkg install -y apache24
```
...