#!/bin/bash

head -n2  /proc/net/netstat | awk -F': ' '
NR==1 { split($2, headers, " "); next }
NR==2 { split($2, values, " ");
        for (i=1; i<=length(headers); i++) 
            print headers[i], values[i]
}'
echo "#####################################"
head -n4  /proc/net/netstat | tail -n2 | awk -F': ' '
NR==1 { split($2, headers, " "); next }
NR==2 { split($2, values, " ");
        for (i=1; i<=length(headers); i++) 
            print headers[i], values[i]
}'
echo "#####################################"
head -n6  /proc/net/netstat | tail -n2 | awk -F': ' '
NR==1 { split($2, headers, " "); next }
NR==2 { split($2, values, " ");
        for (i=1; i<=length(headers); i++) 
            print headers[i], values[i]
}'
