#!/bin/bash
# wg_control.sh
# start or stop wireguard in right order

# fetch wireguard interface names
#exclude all interfaces but wg, replace VPN-PROVIDER with part of your external providers name, for example "mull" as in mullvad-no1.conf
WG_IFACE=$(ip link | awk -F: '$0 !~ "lo|vir|wl|ens|VPN-PROVIDER|^[^0-9]"{print $2;getline}') 
#exclude all interfaces but the external wireguard provider
EXT_WGIFACE=$(ip link | awk -F: '$0 !~ "lo|vir|wl|ens|wg|^[^0-9]"{print $2;getline}')

if [ ! -n "$WG_IFACE" ] && [ ! -n "$EXT_WGIFACE" ]
then
	echo "vpn service down, bringing up"
	wg-quick up $EXT_WGIFACE
	sleep 2
	wg-quick up $WG_IFACE
	echo "external ip is now"
	curl ifconfig.io
	exit 1
else
	echo "bringing down vpn service"
	wg-quick down $WG_IFACE
	sleep 2
	wg-quick down $EXT_WGIFACE
        echo "external ip is now"
	curl ifconfig.io
	exit 1
fi
