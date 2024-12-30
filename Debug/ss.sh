#!/bin/bash

while true;
do
	data_=$(ss -atn '( sport = 80 )' | awk '{ print $1 }' | sort | uniq -c)
	ESTAB_=$(echo "${data_}" | grep ESTAB | awk '{print $1}')
	FIN_WAIT_1_=$(echo "${data_}" | grep FIN-WAIT-1 | awk '{print $1}')
	FIN_WAIT_2_=$(echo "${data_}" | grep FIN-WAIT-2 | awk '{print $1}')
	SYN_RECV_=$(echo "${data_}" | grep SYN-RECV | awk '{print $1}')
	TIME_WAIT_=$(echo "${data_}" | grep TIME-WAIT | awk '{print $1}')
	echo -e "SYN_RECV = ${SYN_RECV_}\t   ESTAB = ${ESTAB_}\t   FIN-WAIT-1 = ${FIN_WAIT_1_}\t   FIN-WAIT-2 = ${FIN_WAIT_2_}\t   TIME_WAIT = ${TIME_WAIT_}"
	sleep 0.5
done
#     41 ESTAB
#      2 FIN-WAIT-1
#      2 LISTEN
#      1 State
#      6 SYN-RECV
#   8191 TIME-WAIT
