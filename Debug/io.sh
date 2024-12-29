#!/bin/bash

# File to be created and deleted
TEST_FILE="disk_io_test_file"
# Directory to test IO (defaults to current directory if not set)
TEST_DIR="."

# Set the size of the test file (in MB)
FILE_SIZE_MB=3000

while (true); do
    dd if=/dev/urandom of="$TEST_DIR/$TEST_FILE" bs=1M count=$FILE_SIZE_MB status=none
    cat "$TEST_DIR/$TEST_FILE" > /dev/null
    rm "$TEST_DIR/$TEST_FILE"
done


