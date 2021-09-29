#!/bin/bash

echo "\"file_size\",\"filename\",\"plot_id\",\"plot_public_key\",\"pool_contract_puzzle_hash\",\"pool_public_key\",\"size\",\"time_modified\",\"harvester\""
curl -s --insecure --cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt --key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:8559/get_harvesters | jq -r '.harvesters[] | .plots[] += {"harvester": .connection.node_id}| .plots[] | map(. // "null") | @csv'
