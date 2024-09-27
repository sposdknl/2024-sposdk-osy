# Server
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

![Server OSY AI](../../Images/server-osy.webp)

## Server pro 3.I. OSY

- Vytvoření virtuálního serveru http://spos.pfsense.cz pro potřeby výuky. Účel je vzdálená komunikace pomoci SSH a provoz Web serveru pro uzivatele ~malyl.

```console
# time vm image provision a12a5c8c-7c33-11ef-acbb-40b034472324 spos-osy
Unpacking guest image, this may take some time...

real	3m9.574s
user	3m6.285s
sys	0m5.603s

# vm start spos-osy
Starting spos-osy
  * found guest in /vms/spos-osy
  * booting...

# vm list 
NAME       DATASTORE  LOADER     CPU  MEMORY  VNC  AUTO     STATE
fbsd14     default    bhyveload  1    256M    -    No       Stopped
spos-osy   default    bhyveload  1    256M    -    No       Running (11568)

# vm info spos-osy
------------------------
Virtual Machine: spos-osy
------------------------
  state: running (11568)
  datastore: default
  loader: bhyveload
  uuid: 5b843c4f-7ccf-11ef-ab57-40b034472324
  cpu: 1
  memory: 256M
  memory-resident: 110059520 (104.960M)

  console-ports
    com1: /dev/nmdm-spos-osy.1B

  network-interface
    number: 0
    emulation: virtio-net
    virtual-switch: public
    fixed-mac-address: 58:9c:fc:0e:c7:ab
    fixed-device: -
    active-device: -
    desc: -
    mtu: 
    bridge: vm-public

  virtual-disk
    number: 0
    device-type: sparse-zvol
    emulation: virtio-blk
    options: -
    system-path: /dev/zvol/zroot/vms/spos-osy/disk0
    bytes-size: 17179869184 (16.000G)
    bytes-used: 4883787776 (4.548G)

  snapshots
    zroot/vms/spos-osy@20231123	80K	Thu Nov 23 22:47 2023
    zroot/vms/spos-osy/disk0@20231123	970M	Thu Nov 23 22:47 2023
```
- Instalace webserveru Apache 2.4 z FreeBSD packages

```console
# pkg install apache24
Updating FreeBSD repository catalogue...
FreeBSD repository is up to date.
All repositories are up to date.
The following 5 package(s) will be affected (of 0 checked):

New packages to be INSTALLED:
	apache24: 2.4.62
	apr: 1.7.3.1.6.3_1
	db18: 18.1.40
	gdbm: 1.23
	jansson: 2.14

Number of packages to be installed: 5

The process will require 119 MiB more space.
23 MiB to be downloaded.

Proceed with this action? [y/N]:

/usr/local/etc/rc.d/apache24 enable
apache24 enabled in /etc/rc.conf

/usr/local/etc/rc.d/apache24 restart
Performing sanity check on apache24 configuration:
Syntax OK
Stopping apache24.
Waiting for PIDS: 1566.
Performing sanity check on apache24 configuration:
Syntax OK
Starting apache24.

cd /usr/local/www/apache24/data/
git clone https://github.com/smejdil/smejdil.github.io
cd smejdil.github.io
cp * ../ && cd ../
rm -rf smejdil.github.io
```

- Konfigurace webserveru Apache, zprovozneni modulu userdir


```console
# diff -u httpd.conf-orig httpd.conf | less
--- httpd.conf-orig     2024-09-27 15:08:55.935249000 +0200
+++ httpd.conf  2024-09-27 15:17:53.064759000 +0200
@@ -176,7 +176,7 @@
 #LoadModule imagemap_module libexec/apache24/mod_imagemap.so
 #LoadModule actions_module libexec/apache24/mod_actions.so
 #LoadModule speling_module libexec/apache24/mod_speling.so
-#LoadModule userdir_module libexec/apache24/mod_userdir.so
+LoadModule userdir_module libexec/apache24/mod_userdir.so
 LoadModule alias_module libexec/apache24/mod_alias.so
 #LoadModule rewrite_module libexec/apache24/mod_rewrite.so
 
@@ -214,7 +214,7 @@
 # e-mailed.  This address appears on some server-generated pages, such
 # as error documents.  e.g. admin@your-domain.com
 #
-ServerAdmin you@example.com
+ServerAdmin webmaster@pfsense.cz
 
 #
 # ServerName gives the name and port that the server uses to identify itself.
@@ -223,7 +223,7 @@
 #
 # If your host doesn't have a registered DNS name, enter its IP address here.
 #
-#ServerName www.example.com:80
+ServerName spos.pfsense.cz:80
 
 #
 # Deny access to the entirety of your server's filesystem. You must
@@ -500,7 +500,7 @@
 #Include etc/apache24/extra/httpd-languages.conf
 
 # User home directories
-#Include etc/apache24/extra/httpd-userdir.conf
+Include etc/apache24/extra/httpd-userdir.conf
 
 # Real-time info on requests and configuration
 #Include etc/apache24/extra/httpd-info.conf
```
...
