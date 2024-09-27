# Install Ubuntu
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

## Manuální instalace OS Linux Ubuntu server

Zde je návod na instalaci [Ubuntu server](https://ubuntu.com/tutorials/install-ubuntu-server#1-overview).

- Stáhněte ISO Ubuntu server (minimalized) 24.04.1 LTS z - [https://cz.releases.ubuntu.com/24.04.1/ubuntu-24.04.1-live-server-amd64.iso](https://cz.releases.ubuntu.com/24.04.1/ubuntu-24.04.1-live-server-amd64.iso)
- Nainstalujte do VirtualBoxu

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
## Automatická instalace OS Linux Ubuntu pomocí Vagrant

- Seznamte se s nástrojem [Vagrant](https://www.vagrantup.com)
- Najděte si Image na [Vagrant portale](https://portal.cloud.hashicorp.com/vagrant/discover)

- V PowerShell si vygenerujeme SSH klíče

```console
PS C:\Users\hp\work\2024-sposdk-osy\Install\Ubuntu> ssh-keygen.exe
Generating public/private rsa key pair.
Enter file in which to save the key (C:\Users\hp/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in C:\Users\hp/.ssh/id_rsa.
Your public key has been saved in C:\Users\hp/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:eKPv0QFFlyP5GHsdVHwx9XIc1NcwroJsiu8/CKwKFOg hp@DESKTOP-DUECDVS
The key's randomart image is:
+---[RSA 3072]----+
|         .o..o=OB|
|.        .+.o..oX|
|..      .  * oo.*|
|. .    o oo o..o |
| E .  . S o..    |
|.   o. = o o     |
|.  ...o.. .      |
|. .  .....       |
|..   .oo+.       |
+----[SHA256]-----+
```

- Váš id_rsa.pub nakopírujte do adresáře Ubuntu
- Do PuTTYGen nahrajte svuj privatni klíč vytvořený pomocí ssh-keygen.exe a uložte public i private pod Vaším jménem do .ssh/
- Do Pagent si nahrajte Váš privátní klíč ve formátu PuTTy
- Vytvořte si v PuTTy session "Ubuntu - Vagrant", host localhost, port 2202
- Připojte se pomocí PuTTY k Ubuntu pomocí ssh klíče pod uživatelem vagrant

```console
PS C:\Users\hp> ls .\.ssh\


    Directory: C:\Users\hp\.ssh


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        27.09.2024      9:23           2655 id_rsa
-a----        27.09.2024      9:23            573 id_rsa.pub
-a----        18.09.2024     13:32            532 known_hosts


PS C:\Users\hp> cp -v .\.ssh\id_rsa.pub .\work\2024-sposdk-osy\Install\Ubuntu\
VERBOSE: Performing the operation "Copy File" on target "Item: C:\Users\hp\.ssh\id_rsa.pub Destination:
C:\Users\hp\work\2024-sposdk-osy\Install\Ubuntu\id_rsa.pub".
```

- Vytvořte si nový virtuální server pomocí Vagrant
- Pripojte se pomoci PuTTY, vagrant ssh, nebo jen ssh vagrant@localhost - tři způsoby.

```console
PS C:\Users\hp\work\2024-sposdk-osy\Install\Ubuntu> vagrant up
Bringing machine 'ubuntu' up with 'virtualbox' provider...
==> ubuntu: Importing base box 'ubuntu/jammy64'...
==> ubuntu: Matching MAC address for NAT networking...
==> ubuntu: Checking if box 'ubuntu/jammy64' version '20240912.0.0' is up to date...
==> ubuntu: Setting the name of the VM: Ubuntu_ubuntu_1727423496176_42556
==> ubuntu: Clearing any previously set network interfaces...
==> ubuntu: Preparing network interfaces based on configuration...
    ubuntu: Adapter 1: nat
==> ubuntu: Forwarding ports...
    ubuntu: 22 (guest) => 2202 (host) (adapter 1)
    ubuntu: 22 (guest) => 2222 (host) (adapter 1)
==> ubuntu: Running 'pre-boot' VM customizations...
==> ubuntu: Booting VM...
==> ubuntu: Waiting for machine to boot. This may take a few minutes...
    ubuntu: SSH address: 127.0.0.1:2222
    ubuntu: SSH username: vagrant
    ubuntu: SSH auth method: private key
    ubuntu: Warning: Connection reset. Retrying...
    ubuntu: Warning: Connection aborted. Retrying...
==> ubuntu: Machine booted and ready!
==> ubuntu: Checking for guest additions in VM...
    ubuntu: The guest additions on this VM do not match the installed version of
    ubuntu: VirtualBox! In most cases this is fine, but in rare cases it can
    ubuntu: prevent things such as shared folders from working properly. If you see
    ubuntu: shared folder errors, please make sure the guest additions within the
    ubuntu: virtual machine match the version of VirtualBox you have installed on
    ubuntu: your host and reload your VM.
    ubuntu:
    ubuntu: Guest Additions Version: 6.0.0 r127566
    ubuntu: VirtualBox Version: 6.1
==> ubuntu: Setting hostname...
==> ubuntu: Mounting shared folders...
    ubuntu: /vagrant => C:/Users/hp/work/2024-sposdk-osy/Install/Ubuntu
==> ubuntu: Running provisioner: file...
    ubuntu: id_rsa.pub => ~/.ssh/me.pub
==> ubuntu: Running provisioner: shell...
    ubuntu: Running: inline script

PS C:\Users\hp\work\2024-sposdk-osy\Install\Ubuntu> vagrant status
Current machine states:

ubuntu                    running (virtualbox)

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.

PS C:\Users\hp\work\2024-sposdk-osy\Install\Ubuntu> vagrant ssh
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-119-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Fri Sep 27 09:55:59 UTC 2024

  System load:  0.04              Processes:               107
  Usage of /:   3.7% of 38.70GB   Users logged in:         0
  Memory usage: 10%               IPv4 address for enp0s3: 10.0.2.15
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update
New release '24.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.
```

...