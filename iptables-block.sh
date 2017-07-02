iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -d 192.168.0.0/16 -j ACCEPT  # replace by your LAN's network(s)
iptables -A OUTPUT -d 8.8.8.8/32 -j ACCEPT  # replace by your LAN's network(s)
iptables -A OUTPUT -d 8.8.4.4/32 -j ACCEPT  # replace by your LAN's network(s)
iptables -A OUTPUT -p tcp \! --syn -j ACCEPT
iptables -P OUTPUT DROP
