#!/bin/sh -e

cd ~/bbb-ap

cp configs/etc/ipsec.conf /etc/ipsec.conf
cp configs/etc/ipsec.secrets /etc/ipsec.secrets
cp configs/etc/xl2tpd/xl2tpd.conf /etc/xl2tpd/xl2tpd.conf
cp configs/etc/ppp/options.l2tpd.client /etc/ppp/options.l2tpd.client

/etc/init.d/ipsec start
/etc/init.d/xl2tpd start
ipsec auto --up L2TP-PSK
echo "c vpn-connection" > /var/run/xl2tpd/l2tp-control
