#!/bin/bash

output_file="/var/log/output.log"

chunk_size=10485760 

total_size=$((1000000 * 10485760))

iterations=$((total_size / chunk_size))

(
    for i in $(seq 1 "$iterations"); do
        head -c "$chunk_size" < /dev/zero >> "$output_file"
        sleep 0.1
    done
    while true; do sleep 1; done
) &
writer_pid=$!

sleep 2

rm -f "$output_file"

> "$output_file" 
(
    for i in $(seq 1 "$iterations"); do
        head -c "$chunk_size" < /dev/zero >> "$output_file"
        sleep 0.1
    done
) &

wait

