#!/usr/bin/env bash

# Aktualizace repository
sudo dnf update

# Instalace balicku apache2
sudo dnf install -y httpd

# Povoleni sluzby apache2
sudo systemctl enable httpd

# Restart sluzby apache2
sudo systemctl restart httpd

# EOF