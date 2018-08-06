#!/bin/bash

ipaddr="XX.XX.XX.XX"

for port in {1..65535}; do
    (echo  > /dev/tcp/$ipaddr/$port) >& /dev/null && echo "Port $port open"
done
