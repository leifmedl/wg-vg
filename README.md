# wg-vg
Wireguard based vpn gateway.
Ultimateley i want these scripts to let me easily setup a wireguard vpn gateway appliance.
it relies on three interfaces. 
the ethernet interface, wg0 and a wireguard interface connected to a vpn provider.
i want to easily open forwarded ports from the vpn provider in to wg0 and ethernet interface

wireguard root


setup_helper.sh

creates files and folders


wg0.conf 

config file for private wireguard interface


vpn-provider.conf

config file for external vpn provider


envStatic.sh

contains environment vars


wg0_firewall.sh

contains postup and postdown iptable rules


vpn_provider_firewall.sh

contains postup and postdown iptable rules


add_peer.sh

add wireguard peers


list_peer.sh

lists active peers


wg_restart.sh

restarts interfaces in set order
