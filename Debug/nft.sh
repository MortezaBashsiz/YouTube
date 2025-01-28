sudo sysctl -w net.ipv4.ip_forward=1
sudo nft add table ip nat
sudo nft add chain ip nat prerouting { type nat hook prerouting priority -100 \; }
sudo nft add chain ip nat postrouting { type nat hook postrouting priority 100 \; }
sudo nft add rule ip nat postrouting oifname "enp1s0" iifname "enp7s0" masquerade

sudo nft add table ip filter
sudo nft add chain ip filter forward { type filter hook forward priority 0 \; }
#sudo nft add rule ip filter forward ip saddr 192.168.150.110 tcp sport 80 drop
