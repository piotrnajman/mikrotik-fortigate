# may/12/2023 11:20:14 by RouterOS 6.49.7
# software id = XETJ-1LJT
#
# model = CCR1036-12G-4S
# serial number = AA8A0ADF52BB
/ip address
add address=10.1.11.1/24 interface=LAN-B01 network=10.1.11.0
add address=10.1.12.1/24 interface=LAN-B02 network=10.1.12.0
add address=10.1.13.1/24 interface=LAN-B03 network=10.1.13.0
add address=10.1.14.1/24 interface=LAN-B04 network=10.1.14.0
add address=10.1.15.1/24 interface=LAN-B0508 network=10.1.15.0
add address=10.1.17.1/24 interface=LAN-A network=10.1.17.0
add address=10.1.19.1/24 interface=BR_AP network=10.1.19.0
add address=10.1.20.1/24 interface=BR_AP network=10.1.20.0
add address=10.1.21.1/24 interface=BR_AP network=10.1.21.0
add address=10.1.23.1/24 disabled=yes interface=E12-PDN network=10.1.23.0
add address=10.1.30.1/24 comment="IP Guest - 12.2.2016 - Fauzi" interface=\
    BR_AP network=10.1.30.0
add address=192.168.30.1/25 comment="Lokal Server " interface=\
    "E05-Uplink Intranet" network=192.168.30.0
add address=10.1.24.1/24 comment=AP_Gadget interface=BR_AP network=10.1.24.0
add address=10.1.25.1/24 comment=AP_Gadget interface=BR_AP network=10.1.25.0
add address=10.47.211.1/24 comment="simponi - intra ipsec" disabled=yes \
    interface="E05-Uplink Intranet" network=10.47.211.0
add address=10.1.18.1/24 interface=LAN-C network=10.1.18.0
add address=10.2.2.1/25 comment="Gateway Unifi" interface=BR_AP network=\
    10.2.2.0
add address=10.1.26.1/24 comment="Pool Tambahan 14-des-2015" interface=BR_AP \
    network=10.1.26.0
add address=202.46.15.117/28 comment="disable fauzi 05.1.2016" disabled=yes \
    interface=E01-Uplink01 network=202.46.15.112
add address=202.46.15.120/28 comment="disable fauzi 05.1.2016" disabled=yes \
    interface=E01-Uplink01 network=202.46.15.112
add address=202.46.15.137/27 comment=\
    "BapetenCloud.go.id -- Uptade 15.12.20.21---" disabled=yes interface=\
    E01-Uplink01 network=202.46.15.128
add address=10.1.31.1/24 comment="IP Guest - 12.2.2016 - Fauzi" interface=\
    BR_AP network=10.1.31.0
add address=10.1.22.1/24 comment="IP Guest --- disable fauzi" disabled=yes \
    interface=BR_AP network=10.1.22.0
add address=10.1.27.1/24 comment="Pool Tambahan 12.2.2016 - Fauzi" interface=\
    BR_AP network=10.1.27.0
add address=10.1.28.1/24 comment="Pool Tambahan 12.2.2016 - Fauzi" interface=\
    BR_AP network=10.1.28.0
add address=202.46.15.130/27 comment="Gw PPTP " disabled=yes interface=\
    E01-Uplink01 network=202.46.15.128
add address=202.46.15.133/27 comment="turn -- Uptade 15.12.20.21---" \
    disabled=yes interface=E01-Uplink01 network=202.46.15.128
add address=202.46.15.156/27 comment=\
    "NAT Dummy Pihak ke3 30.3 -- Uptade 15.12.20.21---" disabled=yes \
    interface=E01-Uplink01 network=202.46.15.128
add address=202.46.15.154/27 comment="Argis Bapeten -- Uptade 15.12.20.21---" \
    disabled=yes interface=E01-Uplink01 network=202.46.15.128
add address=202.46.15.157/27 comment=SARIS disabled=yes interface=\
    E01-Uplink01 network=202.46.15.128
add address=182.23.49.90/28 comment="OC baru -- Update Fauzi 16.1.2019 " \
    interface=E02-Uplink02 network=182.23.49.80
add address=182.23.49.91/28 comment="Mail -- Update Fauzi 16.1.2019 " \
    interface=E02-Uplink02 network=182.23.49.80
add address=10.1.1.1/24 comment="OpenVPN " disabled=yes interface=\
    BridgeOpenVPN network=10.1.1.0
add address=182.23.49.86/28 comment=\
    "Nutanix BapetenGoid-- Update Fauzi 8.7.2020 " interface=E02-Uplink02 \
    network=182.23.49.80
add address=202.46.15.143/27 comment=\
    "Pihak ke3 BJIK 30.95 -- Uptade 15.12.20.21---" disabled=yes interface=\
    E01-Uplink01 network=202.46.15.128
add address=202.46.15.149/27 comment="NEW MAIL -- Uptade 15.12.20.21---" \
    disabled=yes interface=E01-Uplink01 network=202.46.15.128
add address=202.46.15.134/27 comment=Mail disabled=yes interface=E01-Uplink01 \
    network=202.46.15.128
add address=182.23.49.92/28 comment="Puhak ke 3 LA 30.95" interface=\
    E02-Uplink02 network=182.23.49.80
add address=182.23.49.93/28 comment="Nutanix Balis -- Update Fauzi 8.7.2020" \
    interface=E02-Uplink02 network=182.23.49.80
add address=202.46.15.38/27 comment=WS-API disabled=yes interface=\
    E01-Uplink01 network=202.46.15.32
add address=202.46.15.144/27 comment=\
    "website, todolist, supersonik -- Uptade 15.12.20.21---" disabled=yes \
    interface=E01-Uplink01 network=202.46.15.128
add address=202.46.15.139/27 comment="SFTP IRIX -- Uptade 15.12.20.21---" \
    disabled=yes interface=E01-Uplink01 network=202.46.15.128
add address=100.100.100.1/24 comment="DRC BJIK To BATAN" disabled=yes \
    interface="SFP01-Lised Line IPTEKNET" network=100.100.100.0
add address=202.46.15.136/27 comment="New RDMS -- Uptade 15.12.20.21---" \
    disabled=yes interface=E01-Uplink01 network=202.46.15.128
add address=182.23.49.82/28 comment="GW Mikrotik LA" interface=E02-Uplink02 \
    network=182.23.49.80
add address=202.46.15.138/27 comment="API BAPETEN" disabled=yes interface=\
    E01-Uplink01 network=202.46.15.128
add address=202.46.15.145/27 comment="New Serasi - Nutanix - Update Fauzi - 08\
    .07.2020 -- Uptade 15.12.20.21---" disabled=yes interface=E01-Uplink01 \
    network=202.46.15.128
add address=10.1.16.1/24 comment="Update Fauzi 18.1.19" interface=LAN-B06 \
    network=10.1.16.0
add address=182.23.49.87/28 comment=\
    "New Serasi - Nutanix - Update Fauzi - 08.07.2020" interface=E02-Uplink02 \
    network=182.23.49.80
add address=182.23.49.94/28 comment="API WEB" interface=E02-Uplink02 network=\
    182.23.49.80
add address=10.1.32.1/24 comment="IP Guest BPK" interface=BR_AP network=\
    10.1.32.0
add address=202.46.15.155/27 comment=BATAVIA disabled=yes interface=\
    E01-Uplink01 network=202.46.15.128
add address=182.23.49.88/28 comment=\
    "Nat Dummy (Pihak 3)  30.3 - Update Fauzi 7.10.2020" disabled=yes \
    interface=E02-Uplink02 network=182.23.49.80
add address=182.23.49.89/28 comment="NAT IP PDN" interface=E02-Uplink02 \
    network=182.23.49.80
add address=182.23.49.84/28 comment="RDMS NEW - 22.12.2021" interface=\
    E02-Uplink02 network=182.23.49.80
add address=202.46.15.140 comment="-- Uptade 15.12.20.21---" interface=\
    "SFP01-Lised Line IPTEKNET" network=202.46.15.128
add address=182.23.49.85/28 comment="IP BSRE -- Update Fauzi 7.10.2020" \
    disabled=yes interface=E02-Uplink02 network=182.23.49.80
add address=110.110.110.1 comment=coba disabled=yes network=110.110.110.0
add address=36.93.17.146/29 comment=TELKOM disabled=yes interface=\
    E01-Uplink01 network=36.93.17.144
add address=36.67.221.66/26 comment="New GW TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=172.16.0.1/24 comment="Lisedline Bapeten - BJIK" interface=\
    "SFP01-Lised Line IPTEKNET" network=172.16.0.0
add address=10.127.255.174 comment="PDN2 Metro-E" disabled=yes interface=\
    E12-PDN network=10.127.255.172
add address=27.1.1.1/24 comment="PDN Metro-E" disabled=yes interface=E12-PDN \
    network=27.1.1.0
add address=192.168.255.1/24 comment=lama disabled=yes interface=\
    "SFP04-BackTo Back" network=192.168.255.0
add address=192.168.255.1/24 comment="New OpenVPN " interface=BridgeOpenVPN \
    network=192.168.255.0
add address=10.1.1.1/30 comment="Back To Back PDN 2 - Lisedline" interface=\
    "SFP04-BackTo Back" network=10.1.1.0
add address=36.67.221.68/26 comment="ns1 TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.70/26 comment="Mail TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.71/26 comment="Bapeten TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.72/26 comment="Pihak 3 TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.73/26 comment="Balis TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.74/26 comment="Serasi TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.75/26 comment="Api WS TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.69/26 comment="Cloud TELKOM" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.76/26 comment=driveTELKOM interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.77/26 comment=collabTELKOM interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.67/26 comment="RDMS Telkom" interface=E01-Uplink01 \
    network=36.67.221.64
add address=36.67.221.79/26 comment=lumTELKOM interface=E01-Uplink01 network=\
    36.67.221.64
