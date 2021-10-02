#!/bin/bash

[[ -z "$1" ]] && echo -e "No block height supplied.\nUsage:\t./get_block_record_by_height.sh \"920120\"" && exit 1

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/full_node/private_full_node.crt --key ~/.chia/mainnet/config/ssl/full_node/private_full_node.key -d "{\"height\":\"$1\"}" -H "Content-Type: application/json" -X POST https://localhost:8555/get_block_record_by_height | jq