# may/12/2023 11:22:13 by RouterOS 6.49.7
# software id = XETJ-1LJT
#
# model = CCR1036-12G-4S
# serial number = AA8A0ADF52BB
/ip firewall filter
add action=accept chain=input comment=OpenVPN dst-port=1194 protocol=tcp
add action=accept chain=input comment=OpenVPN dst-port=1194 protocol=udp
add action=accept chain=input comment=OpenVPN dst-port=500 protocol=udp
add action=accept chain=input comment=OpenVPN dst-port="" protocol=udp \
    src-port=500
add action=accept chain=input comment="L2TP IPSEC" protocol=ipsec-esp
add action=accept chain=input comment="L2TP UDP" dst-port=1701,4500 port="" \
    protocol=udp
add action=drop chain=forward comment=\
    "Blok L2TP Selain port 80 , 443  IP diatas 51-240" dst-port=!80,443 \
    protocol=tcp src-address-list=L2TP-80
add action=accept chain=forward comment=\
    "Accept User Local ke Server -- Update Fauzi 31.3.21" dst-address-list=\
    "Allow  IP Server Lokal" dst-port=21,22,23,3306,10000,8006,9440 protocol=\
    tcp src-address-list="Allow  IP Server Lokal"
add action=accept chain=forward comment=\
    "Accept User Local ke Server -- Update Fauzi 31.3.21" dst-address-list=\
    "Allow  IP Server Lokal" dst-port=21,22,23,3306,10000,8006,9440 protocol=\
    udp src-address-list="Allow  IP Server Lokal"
add action=accept chain=forward comment="IPSec PDN" dst-address-list=\
    IPSEC-PDN src-address-list=VDC-PDN
add action=accept chain=forward comment="IPSec PDN" dst-address-list=VDC-PDN \
    src-address-list=IPSEC-PDN
add action=drop chain=forward comment=\
    "Drop Port User Local ke Server -- Update Fauzi 31.3.21" dst-port=\
    21,22,23,3306,10000,8006,9440 protocol=tcp
add action=drop chain=forward comment=\
    "Drop Port User Local ke Server -- Update Fauzi 31.3.21" dst-port=\
    21,22,23,3306,10000,8006,9440 protocol=udp
add action=drop chain=output comment="Block UDP to outside -- Added By NoFee" \
    disabled=yes dst-port=!53 out-interface=E02-Uplink02 protocol=udp
add action=drop chain=input comment="Block UDP Mikrotik DNS -- Fauzi" \
    dst-port=53 in-interface=E01-Uplink01 protocol=udp
add action=drop chain=input comment="Block TCP Mikrotik DNS -- Fauzi" \
    dst-port=53 in-interface=E01-Uplink01 protocol=tcp
add action=drop chain=input comment="Block UDP Mikrotik DNS -- Fauzi" \
    dst-port=53 in-interface=E02-Uplink02 protocol=udp
add action=drop chain=input comment="Block TCP Mikrotik DNS -- Fauzi" \
    dst-port=53 in-interface=E02-Uplink02 protocol=tcp
add action=drop chain=forward comment="BLOCK SNMP" dst-address-list=\
    !ServerMonitoring dst-port=161,162 protocol=udp src-address-list=\
    !ServerMonitoring
add action=drop chain=output comment="Block UDP to outside -- Added By NoFee" \
    dst-port=5432 out-interface=E01-Uplink01 protocol=tcp
add action=drop chain=input comment="Block UDP to outside -- Added By NoFee" \
    dst-port=5432 in-interface=E01-Uplink01 protocol=tcp
add action=drop chain=input comment="Block UDP to outside -- Added By NoFee" \
    dst-port=5432 in-interface=E02-Uplink02 protocol=tcp
add action=drop chain=input comment=\
    "Block UDP port 53 (DNS Request)  from outside -- Added By NoFee" \
    disabled=yes dst-port=!53 in-interface=Speedy03 protocol=udp
add action=drop chain=forward comment=\
    "Block UnTrusted MAC - Gedung B Lantai 01" in-interface=LAN-B01 \
    src-address-list=!TrustedMAC
add action=drop chain=forward comment=\
    "Block UnTrusted MAC - Gedung B Lantai 02" in-interface=LAN-B02 \
    src-address-list=!TrustedMAC
add action=drop chain=forward comment=\
    "Block UnTrusted MAC - Gedung B Lantai 03" in-interface=LAN-B03 \
    src-address-list=!TrustedMAC
add action=drop chain=forward comment=\
    "Block UnTrusted MAC - Gedung B Lantai 04" in-interface=LAN-B04 \
    src-address-list=!TrustedMAC
add action=drop chain=forward comment="Block UnTrusted MAC - Gedung C" \
    in-interface=LAN-C src-address-list=!TrustedMAC
add action=drop chain=forward comment="Block UnTrusted MAC - Gedung A" \
    in-interface=LAN-A src-address-list=!TrustedMAC
add action=drop chain=forward comment=\
    "Block UnTrusted MAC - Gedung B Lt 6 Update Fauzi 18.1.19" in-interface=\
    LAN-B06 src-address-list=!TrustedMAC
add action=drop chain=forward comment=\
    "Block UnTrusted MAC - Gedung B Lantai 05 & 08" in-interface=LAN-B0508 \
    src-address-list=!TrustedMAC
add action=reject chain=forward comment=drop_fb dst-address-list=\
    !Allow_Sosmed dst-port=443,80 protocol=tcp reject-with=\
    icmp-network-unreachable src-address-list=!Allow_Sosmed time=\
    8h-16h,mon,tue,wed,thu,fri tls-host=*.facebook.com
add action=reject chain=forward comment=drop_ig dst-address-list=\
    !Allow_Sosmed dst-port=443,80 protocol=tcp reject-with=\
    icmp-network-unreachable src-address-list=!Allow_Sosmed time=\
    8h-16h,mon,tue,wed,thu,fri tls-host=*.instagram.com
add action=reject chain=forward comment=drop_twitter dst-address-list=\
    !Allow_Sosmed dst-port=443,80 protocol=tcp reject-with=\
    icmp-network-unreachable src-address-list=!Allow_Sosmed time=\
    8h-16h,mon,tue,wed,thu,fri tls-host=*.twitter.com
add action=log chain=forward comment="Drop Access to social media" disabled=\
    yes
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    dst-address-list=!socialmedia layer7-protocol=twitter src-address-list=\
    !socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    dst-address-list=!socialmedia layer7-protocol=hdhome src-address-list=\
    !socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol=myspace src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol=path src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol=hi5 src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol="Pokemon  login" src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol=connectify src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol="Pokemon  web" src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol="Pokemon api" src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol=Pokemonweb src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    dst-address-list=!socialmedia layer7-protocol=facebook src-address-list=\
    !socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    dst-address-list=!socialmedia layer7-protocol=instagram src-address-list=\
    !socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    layer7-protocol=*B src-address-list=!socialmedia
add action=drop chain=forward comment="Block Social Media" disabled=yes \
    dst-address-list=!socialmedia layer7-protocol=kumpulbagi \
    src-address-list=!socialmedia
add action=drop chain=forward comment="drop Guest to Local Server" disabled=\
    yes dst-address-list=LocalServer out-interface="E05-Uplink Intranet" \
    src-address-list=Klien
add action=drop chain=forward comment="Guest allow Balis - Bapeten.go.id" \
    disabled=yes dst-address-list="Lokal Guest" out-interface=\
    "E05-Uplink Intranet" src-address-list=Guest
add action=drop chain=forward comment="Drop Port User Lokal ke Server" \
    disabled=yes dst-address=10.1.28.184 out-interface="E05-Uplink Intranet" \
    src-address-list=!Lokal_OS
add action=drop chain=forward disabled=yes dst-address=192.168.30.2 dst-port=\
    !80,22,21,53 protocol=tcp
add action=log chain=forward comment=\
    "Drop Access webproxy from outside Network" disabled=yes
add action=add-src-to-address-list address-list=ProxyDenied \
    address-list-timeout=1w chain=input disabled=yes dst-port=8800 \
    in-interface=E01-Uplink01 protocol=tcp
add action=add-src-to-address-list address-list=ProxyDenied \
    address-list-timeout=1w chain=input disabled=yes dst-port=8800 \
    in-interface=Speedy01 protocol=tcp
add action=add-src-to-address-list address-list=ProxyDenied \
    address-list-timeout=1w chain=input disabled=yes dst-port=8800 \
    in-interface=Speedy02 protocol=tcp
add action=add-src-to-address-list address-list=ProxyDenied \
    address-list-timeout=1w chain=input disabled=yes dst-port=8800 \
    in-interface=Speedy03 protocol=tcp
add action=drop chain=input comment="close proxy jalur IPTEKNET" disabled=yes \
    dst-port=8080 in-interface=E01-Uplink01 protocol=tcp
add action=drop chain=input comment="close proxy jalur LINTASARTA" disabled=\
    yes dst-port=8080 in-interface=E02-Uplink02 protocol=tcp
add action=drop chain=input disabled=yes dst-port=8800 in-interface=Speedy02 \
    protocol=tcp
add action=drop chain=input disabled=yes dst-port=8800 in-interface=Speedy03 \
    protocol=tcp
add action=drop chain=forward comment=\
    "blok port 25 keluar - ipteknet enable  by dian 220118 08:11 AM" \
    dst-port=25 hotspot=!from-client out-interface=E01-Uplink01 protocol=tcp \
    src-address=202.46.15.130
add action=drop chain=forward comment=\
    "blok port 25 keluar - ipteknet enable  by dian 220118 08:11 AM" \
    dst-port=25 hotspot=!from-client out-interface=E02-Uplink02 protocol=tcp \
    src-address=182.23.49.81
add action=drop chain=forward comment=\
    "blok port 25 keluar - ipteknet enable  by dian 220118 08:11 AM" \
    dst-address=202.46.15.130 dst-port=25 hotspot=!from-client out-interface=\
    E01-Uplink01 protocol=tcp
add action=drop chain=forward comment=\
    "blok port 25 keluar - lintasarta disable by dian 300816 11:47" \
    dst-address=182.23.49.81 dst-port=25 hotspot=!from-client out-interface=\
    E02-Uplink02 protocol=tcp
add action=drop chain=forward comment="Blok Spammer **** IPTEKNET" dst-port=\
    25 out-interface=E01-Uplink01 protocol=tcp src-address=202.46.15.130 \
    src-address-list=spammer
add action=drop chain=forward comment="Blok  Spammer **** LA" dst-port=25 \
    out-interface=E02-Uplink02 protocol=tcp src-address=182.23.49.81 \
    src-address-list=spammer
add action=add-src-to-address-list address-list=spammer address-list-timeout=\
    1d chain=forward comment="List spammers  **** IPTEKNET" connection-limit=\
    30,32 dst-port=25 limit=50,5:packet out-interface=E01-Uplink01 protocol=\
    tcp
add action=add-src-to-address-list address-list=spammer address-list-timeout=\
    1d chain=forward comment="List spammers  **** LA" connection-limit=30,32 \
    dst-port=25 limit=50,5:packet out-interface=E02-Uplink02 protocol=tcp
add action=drop chain=forward comment="1.6 blok" hotspot=!from-client \
    out-interface=LAN-B02 protocol=icmp src-address=192.168.1.6
add action=drop chain=forward comment="1.6 blok tcp" disabled=yes \
    dst-address=192.168.1.6 out-interface=LAN-B02 protocol=icmp
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=accept chain=forward comment="allow related connections" \
    connection-state=related
add action=accept chain=forward comment="allow established connections" \
    connection-state=established
add action=log chain=forward comment="Drop Port Scanner" disabled=yes \
    src-address-list=!Semua
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input comment="Port scanners to list " \
    protocol=tcp psd=21,3s,3,1 src-address-list="!allow port scan"
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input comment="NMAP FIN Stealth scan" \
    protocol=tcp src-address-list="!allow port scan" tcp-flags=\
    fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input comment="SYN/FIN scan" protocol=tcp \
    src-address-list="!allow port scan" tcp-flags=fin,syn
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input comment="SYN/RST scan" protocol=tcp \
    src-address-list="!allow port scan" tcp-flags=syn,rst
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input comment="FIN/PSH/URG scan" protocol=\
    tcp src-address-list="!allow port scan" tcp-flags=\
    fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input comment="ALL/ALL scan" protocol=tcp \
    src-address-list="!allow port scan" tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2w chain=input comment="NMAP NULL scan" protocol=tcp \
    src-address-list="!allow port scan" tcp-flags=\
    !fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=output comment="dropping port scanners" \
    dst-address-list="port scanners" src-address-list="!allow port scan"
add action=drop chain=input comment="dropping port scanners" \
    dst-address-list="!allow port scan" src-address-list="port scanners"
add action=drop chain=output comment="drop ssh brute forcers" \
    dst-address-list=ssh_blacklist src-address-list="!allow port scan"
add action=drop chain=input comment="drop ssh brute forcers" \
    dst-address-list="!allow port scan" dst-port=21,22,23,8443,8006,10000 \
    protocol=tcp src-address-list=ssh_blacklist
add action=add-src-to-address-list address-list=ssh_blacklist \
    address-list-timeout=1w3d chain=input connection-state=new \
    dst-address-list="!allow port scan" dst-port=21,22,23,8443,8006,10000 \
    protocol=tcp src-address-list=ssh_stage3
add action=add-src-to-address-list address-list=ssh_stage3 \
    address-list-timeout=1m chain=input connection-state=new \
    dst-address-list="!allow port scan" dst-port=21,22,23,8443,8006,10000 \
    protocol=tcp src-address-list=ssh_stage2
add action=add-src-to-address-list address-list=ssh_stage2 \
    address-list-timeout=1m chain=input connection-state=new \
    dst-address-list="!allow port scan" dst-port=21,22,23,8443,8006,10000 \
    protocol=tcp src-address-list=ssh_stage1
add action=add-src-to-address-list address-list=ssh_stage1 \
    address-list-timeout=1m chain=input connection-state=new dst-port=\
    21,22,23,8443,8006,10000 protocol=tcp src-address-list="!allow port scan"
add action=drop chain=forward comment=\
    "Blok PPTP Selain port 80 , 443  IP diatas 51" dst-port=!80,443 protocol=\
    tcp src-address-list=PPTP-80
add action=drop chain=forward comment="Blok  L2TP Selain port 21,80,443  IP di\
    atas 241-254 (FTP untuk pihak ketiga)" dst-port=!21,80,443 protocol=tcp \
    src-address-list="L2TP FTP"
add action=drop chain=forward comment=\
    "Blok  OPEN VPN Selain port 80 , 443  IP diatas 51" dst-port=!80,443 \
    protocol=tcp src-address-list=OPENVPN-80
add action=drop chain=forward comment=\
    "Blok OPEN VPN Selain port 80 , 443  IP diatas 51" dst-port=!161,162 \
    protocol=udp src-address-list=OPENVPN-80
add action=drop chain=forward comment="drop Guest to Local Server" \
    dst-address-list="Lokal Guest" out-interface="E05-Uplink Intranet" \
    src-address-list=Guest
add action=drop chain=forward comment="Blok Porn" layer7-protocol=porn
add action=log chain=forward comment="Firewall Local Server"
add action=drop chain=forward comment="DROP BitTorrent" connection-limit=1,32 \
    layer7-protocol=block-torrent
add action=drop chain=forward comment="DROP Torrent" connection-limit=1,32 \
    layer7-protocol=Torrent-www
add action=drop chain=forward comment="DROP Paket UDP Torrent" \
    connection-limit=1,32 dst-port=53 layer7-protocol=Torrent protocol=udp
add action=drop chain=forward comment="DROP Paket UDP Torrent" \
    connection-limit=1,32 dst-port=53 layer7-protocol=Torrent-Dns protocol=\
    udp
add action=drop chain=forward comment="DROP Paket announce_peers Torrent" \
    connection-limit=1,32 content=announce_peers
add action=drop chain=forward comment="DROP Paket info_hash Torrent" content=\
    info_hash
add action=drop chain=forward comment="DROP Paket getpeers Torrent" content=\
    getpeers
add action=drop chain=forward comment=RDMS dst-address-list="allow  RDMS" \
    src-address=10.1.18.13
add action=drop chain=forward comment=L2TP-HPC dst-address-list="Deny HPC" \
    src-address-list="L2TP HPC"
add action=drop chain=forward comment="Block Email" dst-address-list=Email \
    src-address=10.1.1.20
add action=drop chain=forward comment="202.78.207.10 drop \?\?\?\?\?" \
    dst-address=202.78.207.10 out-interface=E01-Uplink01 src-address-list=\
    Klien
add action=drop chain=forward comment="202.78.207.10 drop \?\?\?\?\?" \
    dst-address=13.107.4.50 out-interface=E01-Uplink01 src-address-list=Klien
add action=drop chain=forward comment="202.78.207.10 drop \?\?\?\?\?" \
    dst-address=185.123.221.163 out-interface=E01-Uplink01
add action=drop chain=forward comment="202.78.207.10 drop \?\?\?\?\?" \
    dst-address=37.239.220.44 out-interface=E01-Uplink01 src-address-list=\
    Klien
add action=drop chain=forward comment="202.78.207.10 drop \?\?\?\?\?" \
    src-address=185.123.221.163
add action=drop chain=forward comment="202.78.207.10 drop \?\?\?\?\?" \
    dst-address=158.69.228.74 out-interface=E01-Uplink01
add action=drop chain=forward layer7-protocol=connectify src-address-list=\
    socialmedia
add action=drop chain=forward comment="Block Bogus  IP/ Fake IP " \
    src-address=0.0.0.0/8
add action=drop chain=forward comment="Block Bogus  IP/ Fake IP " \
    dst-address=0.0.0.0/8
add action=drop chain=forward comment="Block Bogus  IP/ Fake IP " \
    src-address=127.0.0.0/8
add action=drop chain=forward comment="Block Bogus  IP/ Fake IP " \
    dst-address=127.0.0.0/8
add action=drop chain=forward comment="Block Bogus  IP/ Fake IP " \
    src-address=224.0.0.0/3
add action=drop chain=forward comment="Block Bogus  IP/ Fake IP " \
    dst-address=224.0.0.0/3
add action=drop chain=forward comment=SPAM src-address=5.9.152.61
add action=drop chain=forward comment=SPAM src-address=95.60.254.28
add action=drop chain=forward comment=SPAM src-address=195.14.130.217
add action=drop chain=forward comment=SPAM src-address=212.57.32.24
add action=drop chain=forward comment=SPAM dst-address=212.57.32.24
add action=drop chain=forward comment="Packet Tidak Wajar (Fauzi)" \
    dst-address-list=PacketTdkWajar
add action=drop chain=forward comment=\
    "BLOK CONFICKER VIRUS -- SRC Forward - TCP" protocol=tcp src-port=\
    135,136,137,138,139,144,445,5933,48860,6969,7680,8333,55857
add action=drop chain=forward comment=\
    "BLOK CONFICKER VIRUS -- DSC Forward - TCP" dst-port=\
    135,136,137,138,139,144,445,5933,48860,6969,8333,55857 protocol=tcp
add action=drop chain=forward comment=\
    "BLOK CONFICKER VIRUS -- SRC Forward - UDP" protocol=udp src-port=\
    135,136,137,138,139,144,445,5933,48860,6969,8333,55857
add action=drop chain=forward comment=\
    "BLOK CONFICKER VIRUS -- DSC Forward - UDP" dst-port=\
    135,136,137,138,139,144,445,5933,48860,6969,8333,55857 protocol=udp
add action=drop chain=input comment="BLOK CONFICKER VIRUS -- Inbond - TCP" \
    dst-port=135,136,137,138,139,144,445,5933,48860,6969,8333,55857 protocol=\
    tcp
add action=drop chain=output comment="BLOK CONFICKER VIRUS -- Outbond - TCP" \
    protocol=tcp src-port=\
    135,136,137,138,139,144,445,5933,48860,6969,8333,55857
add action=drop chain=input comment="BLOK CONFICKER VIRUS -- Inbond - UDP" \
    dst-port=135,136,137,138,139,144,445,5933,48860,6969,8333,55857 protocol=\
    udp
add action=drop chain=output comment="BLOK CONFICKER VIRUS -- Outbond - UDP" \
    protocol=udp src-port=\
    135,136,137,138,139,144,445,5933,48860,6969,8333,55857
add action=drop chain=forward comment="BLOK Game COC" dst-port=9330-9340 \
    protocol=tcp
add action=drop chain=forward comment="BLOK Game Get Rich" dst-port=\
    10500-10515 protocol=tcp
add action=drop chain=forward comment=Connectify layer7-protocol=connectify \
    protocol=tcp
add action=drop chain=forward comment=Connectify layer7-protocol=connectify \
    protocol=udp
add action=drop chain=forward comment=\
    "L2TP TTE BSRE drop selain 30.7 dan 30.8" dst-address-list="!allow BSRE" \
    src-address-list="L2TP TTE-BSRE"
add action=drop chain=forward comment=\
    "IDRL drop selain web dan FTP 30.97 (akses menggunakan L2TP)" \
    dst-address-list="!allow IDRL" src-address-list="L2TP IDRL"
add action=drop chain=forward comment=\
    "SIPP drop selain web dan FTP 30.97 (akses menggunakan L2TP)" \
    dst-address-list="!allow SIPP" src-address-list="L2TP SIPP"
add action=drop chain=forward comment=\
    "SIMAPI drop selain web dan FTP 30.97 (akses menggunakan L2TP)" \
    dst-address-list="!allow SIMAPI" src-address-list="L2TP SIMAPI"
add action=drop chain=forward comment=\
    "SIPPATEN drop selain web dan FTP 30.96 (akses menggunakan L2TP)" \
    dst-address-list="!allow SIPPATEN" src-address-list="L2TP SIPPATEN"
add action=drop chain=forward comment=\
    "dev-sikopel drop selain web dan FTP 30.96 (akses menggunakan L2TP)" \
    dst-address-list="!allow SIKOPEL" dst-port="" src-address-list=\
    "L2TP SIKOPEL"
add action=drop chain=forward comment=\
    "dev-moodle drop selain web dan FTP 30.96 (akses menggunakan L2TP)" \
    dst-address-list="!allow MOODLE" src-address-list="L2TP MOODLE"
add action=drop chain=forward comment=\
    "dev-justifikasi drop selain web dan FTP 30.96 (akses menggunakan L2TP)" \
    dst-address-list="!allow Justifikasi" src-address-list="L2TP Justifikasi"
add action=drop chain=forward comment="block pizzaseo.com" layer7-protocol=\
    pizzaseo.com
add action=drop chain=forward comment="Drop Port 7680" protocol=tcp src-port=\
    7680
add action=drop chain=forward comment="Drop port 7680" dst-port=7680 \
    protocol=tcp
add action=drop chain=forward comment="Drop Port 7680" protocol=udp src-port=\
    7680
add action=drop chain=forward comment="Drop Port 7680" dst-port=7680 \
    protocol=udp
