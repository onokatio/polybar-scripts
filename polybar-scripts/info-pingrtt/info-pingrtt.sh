#!/bin/sh

HOST=1.1.1.1

if ! ping=$(ping -n -c 1 -W 1 $HOST); then
    echo "# ping failed"
    return 1
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        icon="%{F#3cb703}#%{F-}"
    elif [ "$rtt" -lt 150 ]; then
        icon="%{F#f9dd04}#%{F-}"
    else
        icon="%{F#d60606}#%{F-}"
    fi

    echo "$icon $rtt ms(v4)"
fi
