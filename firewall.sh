#!/bin/bash

sudo apt update
sudo apt install ufw libapache2-mod-geoip geoip-database
sudo a2enmod geoip
curl -sSL https://www.ipdeny.com/ipblocks/data/countries/ir.zone | awk '{print "sudo ufw deny out from any to " $1}' | bash
sudo ufw enable
sudo ufw reload

# Get your IP address
myip=$(curl -sSL https://ifconfig.me)

# Allow SSH traffic from your IP address
sudo ufw allow from $myip to any port 2222
