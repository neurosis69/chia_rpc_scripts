#!/bin/bash
# There is no timestamp/date field for reported errors, so no age of the entries is listed
# rpc requests returns more than 24h, see https://github.com/Chia-Network/chia-blockchain/pull/7906

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt --key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:8559/get_pool_state | jq -c '.pool_state[0].pool_errors_24h[]'