#!/bin/bash
apt update
apt install ufw libapache2-mod-geoip geoip-database -y
a2enmod geoip
apt install geoip-bin -y
curl -sSL https://www.ipdeny.com/ipblocks/data/countries/ir.zone | awk '{print "sudo ufw deny out from any to " $1}' | bash
ufw allow from any to any port 20 proto tcp
ufw allow from any to any port 22 proto tcp
ufw allow from any to any port 2222 proto tcp
ufw allow from any to any port 8443 proto tcp

ufw allow from any to any port 7100 proto tcp
ufw allow from any to any port 7100 proto udp

ufw enable
ufw reload
