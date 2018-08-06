#!/bin/bash

ipaddr="XX.XX.XX.XX"

logfilename="$HOME/$(date '+%Y-%m-%d_%H-%M-%S')-portscan.log"

function log_success ()
{
    string="Port $1 open"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $string" >> $logfilename
}

for port in {1..1000}; do
    (echo  > /dev/tcp/$ipaddr/$port) >& /dev/null && log_success $port || echo "Port $port close"
done
