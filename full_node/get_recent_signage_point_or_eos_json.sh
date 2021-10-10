#/bin/bash

[[ -z "$1" ]] && echo -e "No signage point hash supplied.\nUsage:\t./get_recent_signage_point_or_eos_json.sh \"0xle23l1344deb...\"" && exit 1

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d "{\"sp_hash\":\"$1\"}" -H "Content-Type: application/json" -X POST https://_IP_:8555/get_recent_signage_point_or_eos| jq