#!/bin/bash
# rpc requests returns more than 24h, see https://github.com/Chia-Network/chia-blockchain/pull/7906

echo "\"timestamp\",\"difficulty\""
curl -s --insecure --cert _SSLPATH_/private_farmer.crt --key _SSLPATH_/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8559/get_pool_state | jq -r '.pool_state[].points_acknowledged_24h[] | @csv'