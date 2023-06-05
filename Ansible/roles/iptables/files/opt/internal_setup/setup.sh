#!/bin/bash  -
#===============================================================================
#
#          FILE: setup.sh
#
#         USAGE: ./setup.sh CONFIG_PATH
#
#   DESCRIPTION: This script will install and configure shadowsocks on internal and external host
#
#       OPTIONS: ---
#  REQUIREMENTS: Debian or Ubuntu, Bash
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Morteza Bashsiz (), morteza.bashsiz@gmail.com
#  ORGANIZATION: 
#       CREATED: 10/05/2022 10:25:37 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

config_path="${1}"

_internalIP=$(grep "^internalIP" "${config_path}" | awk -F = '{print $2}')
_internalPort=$(grep "^internalPort" "${config_path}" | awk -F = '{print $2}')
_externalIP=$(grep "^externalIP" "${config_path}" | awk -F = '{print $2}')
_externalPort=$(grep "^externalPort" "${config_path}" | awk -F = '{print $2}')

echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/99-sysctl.conf
sysctl -w net.ipv4.ip_forward=1
systemctl restart iptables

iptables -t filter -I INPUT -p tcp -d "$_internalIP" --dport "$_internalPort" -j ACCEPT
iptables -t filter -I INPUT -p udp -d "$_internalIP" --dport "$_internalPort" -j ACCEPT
iptables -t filter -I OUTPUT -d "$_externalIP" -j ACCEPT
iptables -t filter -I FORWARD -s "$_externalIP" -j ACCEPT
iptables -t filter -I FORWARD -d "$_externalIP" -j ACCEPT
iptables -t nat -I POSTROUTING -j MASQUERADE
iptables -t nat -I PREROUTING -p tcp -d "$_internalIP" --dport "$_internalPort" -j DNAT --to-destination "$_externalIP":"$_externalPort"
iptables -t nat -I PREROUTING -p udp -d "$_internalIP" --dport "$_internalPort" -j DNAT --to-destination "$_externalIP":"$_externalPort"

iptables-save > /etc/iptables/rules.v4
