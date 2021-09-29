#!/bin/bash

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt --key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:8559/get_pool_state | jq -r '.pool_state[0]|with_entries(select([.key] | contains(["_24h"])| not))'