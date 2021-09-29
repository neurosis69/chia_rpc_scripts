#!/bin/bash
# rpc requests returns more than 24h, see https://github.com/Chia-Network/chia-blockchain/pull/7906

echo "\"timestamp\",\"difficulty\""
curl -s --insecure --cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt --key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:8559/get_pool_state | jq -r '.pool_state[].points_found_24h[] | @csv'