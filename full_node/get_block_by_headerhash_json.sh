#!/bin/bash

[[ -z "$1" ]] && echo -e "No header hash supplied.\nUsage:\t./get_block_json.sh \"0xf10787324e4c815ede6b4...\"" && exit 1

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d "{\"header_hash\":\"$1\"}" -H "Content-Type: application/json" -X POST https://_IP_:8555/get_block|  jq