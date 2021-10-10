#!/bin/bash

[[ -z "$1" ]] && echo -e "No block height supplied.\nUsage:\t./get_block_record_by_height.sh \"920120\"" && exit 1

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d "{\"height\":\"$1\"}" -H "Content-Type: application/json" -X POST https://_IP_:8555/get_block_record_by_height | jq