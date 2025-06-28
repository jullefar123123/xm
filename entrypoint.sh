#!/bin/bash

# Check if msr.allow_writes is set
if [ -f /sys/module/msr/parameters/allow_writes ]; then
    value=$(cat /sys/module/msr/parameters/allow_writes)
    if [ "$value" == "on" ]; then
        echo "msr.allow_writes is ON"
    else
        echo "msr.allow_writes is OFF (current value: $value)"
    fi
else
    echo "/sys/module/msr/parameters/allow_writes does not exist. msr kernel module may not be loaded on host."
fi

# Change directory to SRBMiner folder
cd /opt/srbminer || { echo "SRBMiner folder not found!"; exit 1; }

# Keep the container running (replace this with your mining command if needed)
tail -f /dev/null