#!/bin/bash

[[ -z "$1" ]] && echo -e "No including start block height supplied.\nUsage:\t./get_network_space_json.sh \"920120\"" && exit 1
[[ -z "$2" ]] && echo -e "No excluding end block height supplied.\nUsage:\t./get_network_space_json.sh \"920123\"" && exit 2

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/full_node/private_full_node.crt --key ~/.chia/mainnet/config/ssl/full_node/private_full_node.key -d "{\"start\":\"$1\",\"end\":\"$2\"}" -H "Content-Type: application/json" -X POST https://localhost:8555/get_blocks | jq