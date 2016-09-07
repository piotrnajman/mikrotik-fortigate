# aug/31/2016 00:30:55 by RouterOS 6.35.1
# software id = 4MIC-RH25
#
/ip firewall address-list
add address=8.8.8.8 comment="DNS Google Inc." list=dns_hosts
add address=10.0.0.0/24 list=local_subnets
add address=10.0.10.0/24 list=local_subnets
add address=10.0.0.222 disabled=yes comment="HOST AA01" list="local hosts"
add address=10.0.0.37 comment="HOST AA05" list="local hosts"
add address=10.0.0.14 comment="HOST AA15" list="local hosts"
add address=10.0.0.58 comment="HOST AA84" list="local hosts"
add address=10.0.0.46 comment="HOST AA42" list="local hosts"
add address=194.204.159.1 comment=DNS-ORANGE-PL list=dns_hosts
