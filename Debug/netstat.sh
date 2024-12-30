#!/bin/bash

if [ "$1" == "netstat" ]
then
grep "TcpExt" /proc/net/netstat | awk -F': ' '
NR==1 { split($2, headers, " "); next }
NR==2 { split($2, values, " ");
        for (i=1; i<=length(headers); i++) 
            print headers[i], values[i]
}'
elif [ "$1" == "snmp" ]
then
grep "Tcp\:" /proc/net/snmp | awk -F': ' '
NR==1 { split($2, headers, " "); next }
NR==2 { split($2, values, " ");
        for (i=1; i<=length(headers); i++) 
            print headers[i], values[i]
}'
fi
