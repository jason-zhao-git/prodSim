#!/bin/bash
pipe="test_pipe.txt"
exit_code=0

while [ $exit_code -ne 73 ]; do
    sleep 10
    echo 1
    exit_code=$(cat "$pipe")
done