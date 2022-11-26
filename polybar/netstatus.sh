#!/usr/bin/env bash
set -euo pipefail

function _dns {
    awk '/nameserver/ {print $2}' < /etc/resolv.conf | tr "\n" " "
}

function _vpn_pids {
    ps waux | grep openvpn3 | grep -v grep | grep -v openvpn3-service-sessionmgr | grep -v openvpn3-service-logger 2>/dev/null
}
function _vpn {
    local running_pids="$( _vpn_pids )"
    if [ -z "$running_pids" ] ; then
        echo "Off"
    else
        echo "On"
    fi
}

echo "DNS:$(_dns ) VPN:$(_vpn)"
