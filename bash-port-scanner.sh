#!/bin/bash

ipaddr="XX.XX.XX.XX"
logfilename="$HOME/portscan-$(date '+%Y-%m-%d_%H-%M-%S').log"


trap ctrl_c INT
function ctrl_c() {
    echo "** Trapped CTRL-C"
    exit
}

function log_success ()
{
    string="port is $1 opened"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $string" >> $logfilename
}


for port in {1..1001}; do
    timeout 1 bash -c "echo > /dev/tcp/$ipaddr/$port &> /dev/null" &&
        log_success $port ||
        echo "port $port is closed"
done
