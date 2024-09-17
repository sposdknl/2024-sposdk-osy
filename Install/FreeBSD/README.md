# Install FreeBSD
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Install OS

Nainstalujte [FreeBSD](https://www.freebsd.org/releases/14.1R/announce/)
pomocí [Vagrantfile](https://app.vagrantup.com/freebsd/boxes/FreeBSD-14.1-RELEASE)
Windows instalator [vagrant_2.4.1_windows_amd64.msi](https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_windows_amd64.msi)

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
}

...