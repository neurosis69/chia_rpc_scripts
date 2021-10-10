#!/bin/bash

[[ -z "$1" ]] && echo -e "No including start block height supplied.\nUsage:\t./get_network_space_json.sh \"920120\"" && exit 1
[[ -z "$2" ]] && echo -e "No excluding end block height supplied.\nUsage:\t./get_network_space_json.sh \"920123\"" && exit 2

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d "{\"start\":\"$1\",\"end\":\"$2\"}" -H "Content-Type: application/json" -X POST https://_IP_:8555/get_blocks | jq