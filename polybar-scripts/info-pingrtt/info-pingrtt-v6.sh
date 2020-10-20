#!/bin/sh

HOST=2606:4700:4700::1111

if ! ping=$(ping -6 -n -c 1 -W 1 $HOST); then
    echo "# ping failed"
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        icon="%{F#3cb703}%{F-}"
        rtt="%{F#3cb703}$rtt ms%{F-}"
    elif [ "$rtt" -lt 150 ]; then
        icon="%{F#f9dd04}%{F-}"
        rtt="%{F#f9dd04}$rtt ms%{F-}"
    else
        icon="%{F#d60606}%{F-}"
        rtt="%{F#d60606}$rtt ms%{F-}"
    fi

    echo "$icon $rtt (v6)"
fi
