# Server
Repositories for teaching purposes at SPOS DK

Repository pro vyuku na SPOS DK

![Server OSY AI](../../Images/server-osy.webp)

## Server pro 3.I. OSY

- Vytvoření virtuálního serveru [https:/spos.pfsense.cz](https:/spos.pfsense.cz) pro potřeby výuky. Účel je vzdálená komunikace pomoci SSH a provoz Web serveru pro uzivatele [https:/spos.pfsense.cz/~malyl](https:/spos.pfsense.cz/~malyl).


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
--- httpd.conf-orig     2024-09-27 15:08:55.935249000 +0200
+++ httpd.conf  2024-09-27 16:19:03.445445000 +0200
@@ -89,7 +89,7 @@
 #LoadModule cache_module libexec/apache24/mod_cache.so
 #LoadModule cache_disk_module libexec/apache24/mod_cache_disk.so
 #LoadModule cache_socache_module libexec/apache24/mod_cache_socache.so
-#LoadModule socache_shmcb_module libexec/apache24/mod_socache_shmcb.so
+LoadModule socache_shmcb_module libexec/apache24/mod_socache_shmcb.so
 #LoadModule socache_dbm_module libexec/apache24/mod_socache_dbm.so
 #LoadModule socache_memcache_module libexec/apache24/mod_socache_memcache.so
 #LoadModule watchdog_module libexec/apache24/mod_watchdog.so
@@ -145,7 +145,7 @@
 #LoadModule session_dbd_module libexec/apache24/mod_session_dbd.so
 #LoadModule slotmem_shm_module libexec/apache24/mod_slotmem_shm.so
 #LoadModule slotmem_plain_module libexec/apache24/mod_slotmem_plain.so
-#LoadModule ssl_module libexec/apache24/mod_ssl.so
+LoadModule ssl_module libexec/apache24/mod_ssl.so
 #LoadModule dialup_module libexec/apache24/mod_dialup.so
 #LoadModule http2_module libexec/apache24/mod_http2.so
 #LoadModule proxy_http2_module libexec/apache24/mod_proxy_http2.so
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
@@ -523,7 +523,7 @@
 </IfModule>
 
 # Secure (SSL/TLS) connections
-#Include etc/apache24/extra/httpd-ssl.conf
+Include etc/apache24/extra/httpd-ssl.conf
 #
 # Note: The following must must be present to support
 #       starting without SSL on platforms with no /dev/random equivalent


--- httpd-ssl.conf-orig 2024-09-27 16:10:12.852118000 +0200
+++ httpd-ssl.conf      2024-09-27 16:14:00.794939000 +0200
@@ -69,15 +69,17 @@
 #   own preference of either security or performance, therefore this
 #   must be the prerogative of the web server administrator who manages
 #   cpu load versus confidentiality, so enforce the server's cipher order.
-SSLHonorCipherOrder on 
+SSLHonorCipherOrder off
 
 #   SSL Protocol support:
 #   List the protocol versions which clients are allowed to connect with.
 #   Disable SSLv3 by default (cf. RFC 7525 3.1.1).  TLSv1 (1.0) should be
 #   disabled as quickly as practical.  By the end of 2016, only the TLSv1.2
 #   protocol or later should remain in use.
-SSLProtocol all -SSLv3
-SSLProxyProtocol all -SSLv3
+SSLProtocol all -SSLv3 -TLSv1 -TLSv1.1 -TLSv1.2
+#SSLProtocol all -SSLv3
+#SSLProxyProtocol all -SSLv3
+SSLSessionTickets off
 
 #   Pass Phrase Dialog:
 #   Configure the pass phrase gathering process.
@@ -122,8 +124,8 @@
 
 #   General setup for the virtual host
 DocumentRoot "/usr/local/www/apache24/data"
-ServerName www.example.com:443
-ServerAdmin you@example.com
+ServerName spos.pfsense.cz:443
+ServerAdmin webmaster@pfsense.cz
 ErrorLog "/var/log/httpd-error.log"
 TransferLog "/var/log/httpd-access.log"
 
@@ -141,7 +143,8 @@
 #   Some ECC cipher suites (http://www.ietf.org/rfc/rfc4492.txt)
 #   require an ECC certificate which can also be configured in
 #   parallel.
-SSLCertificateFile "/usr/local/etc/apache24/server.crt"
+SSLCertificateFile "/usr/local/etc/letsencrypt/live/spos.pfsense.cz/cert.pem"
+#SSLCertificateFile "/usr/local/etc/apache24/server.crt"
 #SSLCertificateFile "/usr/local/etc/apache24/server-dsa.crt"
 #SSLCertificateFile "/usr/local/etc/apache24/server-ecc.crt"

 @@ -151,7 +154,8 @@
 #   you've both a RSA and a DSA private key you can configure
 #   both in parallel (to also allow the use of DSA ciphers, etc.)
 #   ECC keys, when in use, can also be configured in parallel
-SSLCertificateKeyFile "/usr/local/etc/apache24/server.key"
+SSLCertificateKeyFile "/usr/local/etc/letsencrypt/live/spos.pfsense.cz/privkey.pem"
+#SSLCertificateKeyFile "/usr/local/etc/apache24/server.key"
 #SSLCertificateKeyFile "/usr/local/etc/apache24/server-dsa.key"
 #SSLCertificateKeyFile "/usr/local/etc/apache24/server-ecc.key"
 
@@ -162,6 +166,7 @@
 #   the referenced file can be the same as SSLCertificateFile
 #   when the CA certificates are directly appended to the server
 #   certificate for convenience.
+SSLCertificateChainFile "/usr/local/etc/letsencrypt/live/spos.pfsense.cz/chain.pem"
 #SSLCertificateChainFile "/usr/local/etc/apache24/server-ca.crt"
 
 #   Certificate Authority (CA):
@@ -171,6 +176,7 @@
 #   Note: Inside SSLCACertificatePath you need hash symlinks
 #         to point to the certificate files. Use the provided
 #         Makefile to update the hash symlinks after changes.
+SSLCACertificateFile "/usr/local/etc/letsencrypt/live/spos.pfsense.cz/fullchain.pem"
 #SSLCACertificatePath "/usr/local/etc/apache24/ssl.crt"
 #SSLCACertificateFile "/usr/local/etc/apache24/ssl.crt/ca-bundle.crt"
```
...
